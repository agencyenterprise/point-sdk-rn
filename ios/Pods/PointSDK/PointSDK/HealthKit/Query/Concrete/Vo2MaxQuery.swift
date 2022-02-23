import Foundation
import HealthKit

// MARK: - Vo2MaxQuery

public struct Vo2MaxQuery {
    let unit: HKUnit
    let startDate: Date?
    let endDate: Date
    let isAscending: Bool
    let limit: Int
}

// MARK: - Vo2MaxQuery + HealthQuery

extension Vo2MaxQuery: HealthQuery {}
public extension Vo2MaxQuery {
    var sampleType: HealthQuerySampleType { .vo2Max }
    var queryType: HKQuantityType { .makeQuantityType(for: .vo2Max) }
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
