import Foundation
import HealthKit

// MARK: - StepCountQuery

public struct StepCountQuery {
    let startDate: Date
    let endDate: Date
    let interval: Int
    let includeManuallyAdded: Bool
}

// MARK: - StepCountQuery + HealthQuery

extension StepCountQuery: HealthQuery {}
public extension StepCountQuery {
    var sampleType: HealthQuerySampleType { .stepCount }
    var queryType: HKQuantityType { .makeQuantityType(for: .stepCount) }
    var backgroundUpdateFrequency: HKUpdateFrequency { .hourly }

    func fetch() async throws -> [SimpleSample] {
        try await HealthQueryHelper.fetchValueSamples(
            of: queryType,
            unit: .count(),
            interval: interval,
            startDate: startDate,
            endDate: endDate,
            isAscending: true,
            limit: HKObjectQueryNoLimit,
            includeManuallyAdded: includeManuallyAdded
        )
    }
}
