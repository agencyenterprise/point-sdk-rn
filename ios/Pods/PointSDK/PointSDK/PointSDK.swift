import Foundation

// MARK: - PointSDK

/// Contains important SDK configuration methods such as `setup`.
@frozen public enum PointSDK {}

private extension PointSDK {
    static var _apiKey: String? {
        didSet {
            #if DEBUG
                guard oldValue != nil else { return }
                print("⚠️ Point SDK API key changed after being set. Feel free to ignore this warning if it was intentional.")
            #endif
        }
    }

    static let api: API = ConcreteAPI(accessToken: accessToken)
}

internal extension PointSDK {
    static var apiKey: String {
        guard let apiKey = _apiKey else {
            fatalError("Must call PointSDK.setup(apiKey: , userAccessToken:) before calling any other PointSDK SDK method.")
        }

        return apiKey
    }

    private(set) static var accessToken: String?
    private(set) static var environment: APIEnvironment = .development
}

public extension PointSDK {
    static var uploadMode: UploadMode = .eager
    static var healthKit: HealthKitManager? { .init(api: api) }
    static var dataManager: DataManager { PointDataManager(api: api) }

    /// Call the setup method as soon as possible on your application.
    /// - Parameter apiKey: Your api access key.
    /// - Parameter environment: The enviroment the app is running. Make sure to set this to `production` on release builds.
    /// - Important: Calling any other SDK method before calling `setup` might result in crashes.
    ///
    static func setup(apiKey: String, environment: APIEnvironment = .development) {
        _apiKey = apiKey
        self.environment = environment
    }

    static func login(accessToken: String) async { await api.set(accessToken: accessToken) }
    static func logout() async { await api.set(accessToken: nil) }
}
