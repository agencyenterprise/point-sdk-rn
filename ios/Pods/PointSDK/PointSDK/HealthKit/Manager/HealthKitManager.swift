import Combine
import HealthKit

// MARK: - HealthKitManager

/// Manages the integration with `HealthKit`.
public struct HealthKitManager {
    static let healthStore = HKHealthStore()
    let api: API

    /// Creates an instance if health kit data is available on the current device.
    init?(api: API) {
        // Health kit data isn't available on iPad or mac.
        guard HKHealthStore.isHealthDataAvailable() else { return nil }
        self.api = api
    }
}
