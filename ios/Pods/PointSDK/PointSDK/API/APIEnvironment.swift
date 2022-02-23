// MARK: - APIEnvironment

public enum APIEnvironment {
    case production
    case development
    case staging
}

extension APIEnvironment {
    var apolloURL: URL {
        switch self {
        case .production: return .init(string: "https://production.api.areyoupoint.com/graphql")!
        case .development: return .init(string: "https://dev.api.areyoupoint.com/graphql")!
        case .staging: return .init(string: "https://staging.api.areyoupoint.com/graphql")!
        }
    }
}
