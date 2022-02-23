import Foundation
import HealthKit

// MARK: - MindfulnessQuery

public struct MindfulnessQuery {
    let startDate: Date?
    let endDate: Date
    let isAscending: Bool
    let limit: Int
}

// MARK: - MindfulnessQuery + HealthQuery

extension MindfulnessQuery: HealthQuery {}
public extension MindfulnessQuery {
    var sampleType: HealthQuerySampleType { .mindfulSession }
    var queryType: HKCategoryType { .makeCategoryType(for: .mindfulSession) }
    var backgroundUpdateFrequency: HKUpdateFrequency { .hourly }

    func fetch() async throws -> [DateRangeSample] {
        try await HealthQueryHelper.fetchDateRangeSamples(
            of: queryType,
            startDate: startDate,
            endDate: endDate,
            limit: limit,
            isAscending: isAscending
        )
    }
}
