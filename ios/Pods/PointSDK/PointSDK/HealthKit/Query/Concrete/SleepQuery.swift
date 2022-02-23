import Foundation
import HealthKit

// MARK: - SleepQuery

public struct SleepQuery {
    let startDate: Date
    let endDate: Date
    let isAscending: Bool
    let limit: Int
}

// MARK: - SleepQuery + HealthQuery

extension SleepQuery: HealthQuery {}
public extension SleepQuery {
    var sampleType: HealthQuerySampleType { .sleepAnalysis }
    var queryType: HKCategoryType { .makeCategoryType(for: .sleepAnalysis) }
    var backgroundUpdateFrequency: HKUpdateFrequency { .hourly }

    func fetch() async throws -> [QualitySample] {
        try await HealthQueryHelper.fetchQualitySample(
            categoryType: queryType,
            startDate: startDate,
            endDate: endDate,
            isAscending: isAscending,
            limit: limit
        ) {
            switch HKCategoryValueSleepAnalysis(rawValue: $0) {
            case HKCategoryValueSleepAnalysis.inBed?: return "INBED"
            case HKCategoryValueSleepAnalysis.asleep?: return "ASLEEP"
            case HKCategoryValueSleepAnalysis.awake?: return "AWAKE"
            case nil: return ""
            @unknown default: return "UNKNOWN"
            }
        }
    }
}
