import Foundation
import HealthKit

// MARK: - HeartRateQuery

public struct HeartRateQuery {
    let unit: HKUnit
    let startDate: Date?
    let endDate: Date
    let isAscending: Bool
    let limit: Int
}

// MARK: - HeartRateQuery + HealthQuery

extension HeartRateQuery: HealthQuery {}
public extension HeartRateQuery {
    var sampleType: HealthQuerySampleType { .heartRate }
    var queryType: HKQuantityType { .makeQuantityType(for: .heartRate) }
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
