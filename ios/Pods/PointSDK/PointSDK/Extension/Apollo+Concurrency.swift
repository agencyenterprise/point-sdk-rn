import Apollo

extension ApolloClient {
    func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = false,
        queue: DispatchQueue = .main
    )
    async throws -> Mutation.Data {
        try await withCheckedThrowingContinuation { continuation in
            perform(mutation: mutation, publishResultToStore: false, queue: queue) {
                switch $0 {
                case let .success(value):
                    switchAndContinue(
                        continuation: continuation,
                        value: value.data,
                        error: value.errors.map(APIError.graphQl)
                    )

                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

extension ApolloClient {
    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .main
    )
    async throws -> Query.Data {
        try await withCheckedThrowingContinuation { continuation in
            fetch(query: query, cachePolicy: cachePolicy, contextIdentifier: contextIdentifier, queue: queue) {
                switch $0 {
                case let .success(graphQLResult):
                    switchAndContinue(
                        continuation: continuation,
                        value: graphQLResult.data,
                        error: graphQLResult.errors.map(APIError.graphQl)
                    )
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
