import Apollo

enum APIError: Swift.Error {
    case missingAuth
    case graphQl(errors: [GraphQLError])

    var localizedDescription: String {
        switch self {
        case let .graphQl(errors: errors):
            return errors.map(\.localizedDescription).joined(separator: "\n")

        case .missingAuth: return "Missing authentication"
        }
    }
}
