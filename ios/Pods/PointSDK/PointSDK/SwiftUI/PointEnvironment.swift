#if canImport(SwiftUI)
    import SwiftUI

    // MARK: - PointEnvironmentKey

    private struct PointHealthKitManagerEnvironmentKey: EnvironmentKey {
        static let defaultValue: HealthKitManager? = nil
    }

    private struct PointDataManagerEnvironmentKey: EnvironmentKey {
        static let defaultValue: DataManager? = nil
    }

    public extension EnvironmentValues {
        var pointHealthKitManager: HealthKitManager? {
            get { self[PointHealthKitManagerEnvironmentKey.self] }
            set { self[PointHealthKitManagerEnvironmentKey.self] = newValue }
        }
        
        var pointDataManager: DataManager? {
            get { self[PointDataManagerEnvironmentKey.self] }
            set { self[PointDataManagerEnvironmentKey.self] = newValue }
        }
    }
#endif
