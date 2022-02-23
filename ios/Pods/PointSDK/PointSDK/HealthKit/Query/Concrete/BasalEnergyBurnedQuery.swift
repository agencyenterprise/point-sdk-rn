import Foundation
import HealthKit

// MARK: - BasalEnergyBurnedQuery

public struct BasalEnergyBurnedQuery {
    let unit: HKUnit
    let interval: Int
    let startDate: Date
    let endDate: Date
    let isAscending: Bool
    let limit: Int
    let includeManuallyAdded: Bool
}

// MARK: - BasalEnergyBurnedQuery + HealthQuery

extension BasalEnergyBurnedQuery: HealthQuery {}
public extension BasalEnergyBurnedQuery {
    var sampleType: HealthQuerySampleType { .basalEnergyBurned }
    var queryType: HKQuantityType { .makeQuantityType(for: .basalEnergyBurned) }
    var backgroundUpdateFrequency: HKUpdateFrequency { .hourly }

    func fetch() async throws -> [SimpleSample] {
        try await HealthQueryHelper.fetchValueSamples(
            of: queryType,
            unit: unit,
            interval: interval,
            startDate: startDate,
            endDate: endDate,
            isAscending: isAscending,
            limit: limit,
            includeManuallyAdded: includeManuallyAdded
        )
    }
}
