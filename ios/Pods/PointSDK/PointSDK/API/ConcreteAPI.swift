import Apollo

// MARK: - ConcreteAPI

final actor ConcreteAPI {
    private(set) var accessToken: String? {
        didSet {
            apolloClient = Self.makeApolloClient(accessToken: accessToken, store: store)
        }
    }

    private var apolloClient: ApolloClient
    private let store = ApolloStore()

    init(accessToken: String?) {
        self.accessToken = accessToken
        self.apolloClient = Self.makeApolloClient(accessToken: accessToken, store: store)
    }
}

// MARK: - ConcreteAPI + API

extension ConcreteAPI: API {
    func set(accessToken: String?) async { self.accessToken = accessToken }
}

// MARK: Mutation

extension ConcreteAPI {
    func createHealthSample(input: CreateHealthSampleInput) async throws -> Bool {
        try await checkApiAndToken {
            try await apolloClient.perform(mutation: CreateHealthSampleMutation(input: input))
                .createHealthSample
                .success
        }
    }

    func setUser(birthday: String) async throws -> Bool {
        try await checkApiAndToken {
            try await apolloClient.perform(mutation: SetUserBirthdayMutation(input: birthday))
                .setUserBirthday
                .success
        }
    }
}

// MARK: Query

extension ConcreteAPI {
    func getUser() async throws -> User? {
        try await checkApiAndToken {
            try await apolloClient.fetch(query: GetUserQuery()).user.map { .init(apiUser: $0) }
        }
    }

    func getHealthMetrics(
        filter: [HealthMetricType],
        workoutId: Int?,
        date: String?
    ) async throws -> [GetHealthMetricsQuery.Data.HealthMetric] {
        try await checkApiAndToken {
            try await apolloClient
                .fetch(query: GetHealthMetricsQuery(
                    filter: filter,
                    workoutId: workoutId,
                    date: date
                ))
                .healthMetrics
        }
    }
}

// MARK: -

extension ConcreteAPI {
    static func makeApolloClient(accessToken: String?, store: ApolloStore) -> ApolloClient {
        ApolloClient(
            networkTransport: RequestChainNetworkTransport(
                interceptorProvider: DefaultInterceptorProvider(store: store),
                endpointURL: PointSDK.environment.apolloURL,
                additionalHeaders: accessToken.map { ["Authorization": "Bearer \($0)"] } ?? [:]
            ),
            store: store
        )
    }

    func checkApi<Return>(andPerform block: () async throws -> Return) async throws -> Return {
        _ = PointSDK.apiKey
        return try await block()
    }

    func checkApiAndToken<Return>(andPerform block: () async throws -> Return) async throws -> Return {
        guard accessToken != nil else { throw APIError.missingAuth }
        return try await checkApi(andPerform: block)
    }
}
