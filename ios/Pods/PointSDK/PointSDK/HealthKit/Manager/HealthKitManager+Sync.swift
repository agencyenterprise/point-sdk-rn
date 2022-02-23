import Foundation

extension HealthKitManager {
    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or not.
    func _sync<Query: HealthQuery>(query: Query) async throws -> SyncResult {
        let json = try await query.fetch().jsonString
        return (
            try await api.createHealthSample(
                input: .init(
                    data: json,
                    sampleType: .init(rawValue: query.sampleType.rawValue) ?? .__unknown(query.sampleType.rawValue)
                )
            ),
            json
        )
    }
}

public extension HealthKitManager {
    typealias SyncResult = (success: Bool, value: String)

    /// Syncs the user birthday data from `HealthKit` with the `Point` database.
    /// - Returns: If the operation was a succcess or not.
    func syncUserBirthday() async throws -> SyncResult {
        try await Calendar.current
            .date(from: try HealthKitManager.healthStore.dateOfBirthComponents())
            .map(\.iso8601String)
            .let { $0 ?? "" }
            .let { (try await api.setUser(birthday: $0), $0) }
    }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: SleepQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: StepCountQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: HeartRateQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: HeartRateVariabilitySDNNQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: RestingHeartRateQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: ActiveEnergyBurnedQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: Vo2MaxQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: WorkoutQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: MindfulnessQuery) async throws -> SyncResult { try await _sync(query: query) }

    /// Syncs the `HealthKit` data from the query results with the `Point` database.
    /// - Parameter query: Query to be executed.
    /// - Returns: If the operation was a succcess or no
    func sync(query: BasalEnergyBurnedQuery) async throws -> SyncResult { try await _sync(query: query) }
}
