import Foundation
import HealthKit

// MARK: - ActiveEnergyBurnedQuery

public struct ActiveEnergyBurnedQuery {
    let unit: HKUnit
    let interval: Int
    let startDate: Date
    let endDate: Date
    let isAscending: Bool
    let limit: Int
    let includeManuallyAdded: Bool
}

// MARK: - ActiveEnergyBurnedQuery + HealthQuery

extension ActiveEnergyBurnedQuery: HealthQuery {}
public extension ActiveEnergyBurnedQuery {
    var sampleType: HealthQuerySampleType { .activeEnergyBurned }
    var queryType: HKQuantityType { .makeQuantityType(for: .activeEnergyBurned) }
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
