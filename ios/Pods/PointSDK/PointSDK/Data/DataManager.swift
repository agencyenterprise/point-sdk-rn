
/// Manages the integration with the Point API.
public protocol DataManager {
    /// Get the logged `User` data from the `Point` database.
    /// - Returns: The user data
    func getUserData() async throws -> User?

    /// Gets a list of `HealthMetrics` from the authenticated user.
    /// - Parameter filter: Which kind of metrics will be returned.
    /// - Parameter workoutId: Which specific workout to get metrics from.
    /// - Parameter date: Which date to get the metrics from.
    /// - Returns: The list of health metrics.
    func getHealthMetrics(filter: Set<HealthMetric.Kind>, workoutId: Int?, date: Date?) async throws -> [HealthMetric]
}
