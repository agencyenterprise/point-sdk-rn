import Apollo

protocol API: Actor {
    func set(accessToken: String?) async

    // MARK: - Mutation

    func createHealthSample(input: CreateHealthSampleInput) async throws -> Bool
    func setUser(birthday: String) async throws -> Bool

    // MARK: - Query

    func getUser() async throws -> User?
    func getHealthMetrics(
        filter: [HealthMetricType],
        workoutId: Int?,
        date: String?
    ) async throws -> [GetHealthMetricsQuery.Data.HealthMetric]
}
