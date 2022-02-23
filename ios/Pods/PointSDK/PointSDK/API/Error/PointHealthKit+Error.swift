public extension HealthKitManager {
    /// Specific errors from the PointSDK-HealthKit integration.
    enum Error: Swift.Error {
        /// The operation unexpectedly reported a failure but didn't report an `Error`.
        case unexpectedFailureWithoutError

        /// The operation unexpectedly reported no value or error.
        case unexpectedNilValueAndNilError

        /// `Date` value passed was invalid for the current operation.
        case invalid(date: Date)
    }
}

