import Foundation
import HealthKit

// MARK: - RestingHeartRateQuery

public struct RestingHeartRateQuery {
    let unit: HKUnit
    let startDate: Date?
    let endDate: Date
    let isAscending: Bool
    let limit: Int
}

// MARK: - RestingHeartRateQuery + HealthQuery

extension RestingHeartRateQuery: HealthQuery {}
public extension RestingHeartRateQuery {
    var sampleType: HealthQuerySampleType { .restingHeartRate }
    var queryType: HKQuantityType { .makeQuantityType(for: .restingHeartRate) }
    var backgroundUpdateFrequency: HKUpdateFrequency { .immediate }

    func fetch() async throws -> [QuantitySample] {
        try await HealthQueryHelper.fetchQuantitySamples(
            of: queryType,
            unit: unit,
            startDate: startDate,
            endDate: endDate,
            isAscending: isAscending,
            limit: limit
        )
    }
}
