import Foundation
import HealthKit

// MARK: - WorkoutQuery

public struct WorkoutQuery {
    let startDate: Date?
    let endDate: Date
    let isAscending: Bool
    let limit: Int
}

// MARK: - WorkoutQuery + HealthQuery

extension WorkoutQuery: HealthQuery {}
public extension WorkoutQuery {
    var sampleType: HealthQuerySampleType { .workout }
    var queryType: HKSampleType { .workoutType() }
    var backgroundUpdateFrequency: HKUpdateFrequency { .hourly }

    func fetch() async throws -> [WorkoutSample] {
        try await HealthQueryHelper.fetchWorkoutSamples(
            startDate: startDate,
            endDate: endDate,
            isAscending: isAscending,
            limit: limit
        )
    }
}
