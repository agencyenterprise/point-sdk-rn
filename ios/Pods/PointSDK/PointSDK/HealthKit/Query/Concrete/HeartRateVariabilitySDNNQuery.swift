import Foundation
import HealthKit

// MARK: - HeartRateVariabilitySDNNQuery

public struct HeartRateVariabilitySDNNQuery {
    let unit: HKUnit
    let startDate: Date?
    let endDate: Date
    let isAscending: Bool
    let limit: Int
}

// MARK: - HeartRateVariabilitySDNNQuery + HealthQuery

extension HeartRateVariabilitySDNNQuery: HealthQuery {}
public extension HeartRateVariabilitySDNNQuery {
    var sampleType: HealthQuerySampleType { .heartRateVariabilitySdnn }
    var queryType: HKQuantityType { .makeQuantityType(for: .heartRateVariabilitySDNN) }
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
