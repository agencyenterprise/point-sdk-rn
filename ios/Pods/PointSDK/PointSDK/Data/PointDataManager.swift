// MARK: - PointDataManager

public struct PointDataManager {
    let api: API

    init(api: API) { self.api = api }
}

// MARK: - PointDataManager + DataManager

extension PointDataManager: DataManager {}

public extension PointDataManager {
    func getUserData() async throws -> User? { try await api.getUser() }

    func getHealthMetrics(filter: Set<HealthMetric.Kind>, workoutId: Int?, date: Date?) async throws -> [HealthMetric] {
        try await api.getHealthMetrics(
            filter: filter.map { .init(rawValue: $0.rawValue) ?? .__unknown($0.rawValue) },
            workoutId: workoutId,
            date: date?.iso8601String
        )
        .map(HealthMetric.init)
    }
}
