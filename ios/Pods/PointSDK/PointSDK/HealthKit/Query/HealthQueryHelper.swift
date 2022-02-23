import Foundation
import HealthKit

// MARK: - HealthQueryHelper

enum HealthQueryHelper {}

// MARK: - HealthQueryHelper + Generic

extension HealthQueryHelper {
    static func fetchDateRangeSamples(
        of categoryType: HKCategoryType,
        startDate: Date?,
        endDate: Date,
        limit: Int,
        isAscending: Bool
    ) async throws -> [DateRangeSample] {
        try await withCheckedThrowingContinuation { continuation in
            HKSampleQuery(
                sampleType: categoryType,
                predicate: .dateRange(start: startDate, end: endDate),
                limit: limit,
                sortDescriptors: .healthEndDate(isAscending: isAscending)
            ) {
                switchAndContinue(continuation: continuation, value: $1, error: $2) { samples in
                    samples.map {
                        .init(
                            startDate: $0.startDate.iso8601String,
                            endDate: $0.endDate.iso8601String
                        )
                    }
                }
            }
            .let(HealthKitManager.healthStore.execute)
        }
    }

    static func fetchQuantitySamples(
        of quantityType: HKQuantityType,
        unit: HKUnit,
        startDate: Date?,
        endDate: Date,
        isAscending: Bool,
        limit: Int
    ) async throws -> [QuantitySample] {
        try await withCheckedThrowingContinuation { continuation in
            HKSampleQuery(
                sampleType: quantityType,
                predicate: .dateRange(start: startDate, end: endDate),
                limit: limit,
                sortDescriptors: .healthEndDate(isAscending: isAscending)
            ) {
                switchAndContinue(continuation: continuation, value: $1, error: $2) { samples in
                    samples.map { $0 as! HKQuantitySample }
                        .map {
                            .init(
                                value: $0.quantity.doubleValue(for: unit),
                                id: $0.uuid,
                                sourceName: $0.sourceRevision.source.name,
                                sourceID: $0.sourceRevision.source.bundleIdentifier,
                                startDate: $0.startDate.iso8601String,
                                endDate: $0.endDate.iso8601String,
                                metadata: $0.metadata?.mapValues(String.init(describing:)) ?? [:]
                            )
                        }
                }
            }
            .let(HealthKitManager.healthStore.execute)
        }
    }

    static func fetchWorkoutSamples(
        startDate: Date?,
        endDate: Date,
        isAscending: Bool,
        limit: Int
    ) async throws -> [WorkoutSample] {
        try await withCheckedThrowingContinuation { continuation in
            HKSampleQuery(
                sampleType: .workoutType(),
                predicate: .dateRange(start: startDate, end: endDate),
                limit: limit,
                sortDescriptors: .healthEndDate(isAscending: isAscending)
            ) {
                switchAndContinue(continuation: continuation, value: $1, error: $2) { samples in
                    samples.map { $0 as! HKWorkout }
                        .map {
                            WorkoutSample(
                                id: $0.uuid.uuidString,
                                activityId: Int($0.workoutActivityType.rawValue),
                                activityName: $0.workoutActivityType.activityName,
                                calories: $0.totalEnergyBurned?.doubleValue(for: .kilocalorie()) ?? 0.0,
                                tracked: ($0.metadata?[HKMetadataKeyWasUserEntered] as? NSNumber)?.intValue != 1,
                                metadata: $0.metadata?.mapValues(String.init(describing:)) ?? [:],
                                sourceName: $0.sourceRevision.source.name,
                                sourceId: $0.sourceRevision.source.bundleIdentifier,
                                device: $0.device?.name,
                                distance: $0.totalDistance?.doubleValue(for: .mile()) ?? 0.0,
                                start: $0.startDate.iso8601String,
                                end: $0.endDate.iso8601String
                            )
                        }
                }
            }
            .let(HealthKitManager.healthStore.execute)
        }
    }

    static func fetchTrackedSamples(
        type: HKSampleType,
        unit: HKUnit,
        startDate: Date?,
        endDate: Date,
        isAscending: Bool,
        limit: Int
    ) async throws -> [TrackedValueSample] {
        try await withCheckedThrowingContinuation { continuation in
            HKSampleQuery(
                sampleType: type,
                predicate: .dateRange(start: startDate, end: endDate),
                limit: limit,
                sortDescriptors: .healthEndDate(isAscending: isAscending)
            ) {
                switchAndContinue(continuation: continuation, value: $1, error: $2) { samples in
                    samples.map { $0 as! HKQuantitySample }
                        .map {
                            .init(
                                value: $0.quantity.doubleValue(for: unit),
                                tracked: ($0.metadata?[HKMetadataKeyWasUserEntered] as? NSNumber)?.intValue != 1,
                                sourceName: $0.sourceRevision.source.name,
                                sourceId: $0.sourceRevision.source.bundleIdentifier,
                                device: $0.device?.name,
                                start: $0.startDate.iso8601String,
                                end: $0.endDate.iso8601String
                            )
                        }
                }
            }
            .let(HealthKitManager.healthStore.execute)
        }
    }

    static func fetchValueSamples(
        of quantityType: HKQuantityType,
        unit: HKUnit,
        interval: Int,
        startDate: Date,
        endDate: Date,
        isAscending: Bool,
        limit: Int,
        includeManuallyAdded: Bool
    ) async throws -> [SimpleSample] {
        try await withCheckedThrowingContinuation {
            createAndExecuteQuery(
                quantityType: quantityType,
                unit: unit,
                interval: interval,
                startDate: startDate,
                endDate: endDate,
                isAscending: isAscending,
                limit: limit,
                includeManuallyAdded: includeManuallyAdded,
                continuation: $0
            )
        }
    }

    static func fetchQualitySample(
        categoryType: HKCategoryType,
        startDate: Date?,
        endDate: Date,
        isAscending: Bool,
        limit: Int,
        valueHandler: @escaping (_ value: Int) -> String
    ) async throws -> [QualitySample] {
        try await withCheckedThrowingContinuation { continuation in

            HKSampleQuery(
                sampleType: categoryType,
                predicate: .dateRange(start: startDate, end: endDate),
                limit: limit,
                sortDescriptors: [NSSortDescriptor.healthEndDate(isAscending: isAscending)]
            ) {
                switchAndContinue(continuation: continuation, value: $1, error: $2) { samples in
                    samples.map { $0 as! HKCategorySample }
                        .map { sample in
                            .init(
                                value: valueHandler(sample.value),
                                id: sample.uuid,
                                sourceName: sample.sourceRevision.source.name,
                                sourceID: sample.sourceRevision.source.bundleIdentifier,
                                startDate: sample.startDate.iso8601String,
                                endDate: sample.endDate.iso8601String,
                                metadata: sample.metadata?.mapValues(String.init(describing:)) ?? [:]
                            )
                        }
                }
            }
            .let(HealthKitManager.healthStore.execute)
        }
    }
}

// MARK: -

private extension HealthQueryHelper {
    static func makeStatisticsCollectionQuery(
        quantityType: HKQuantityType,
        interval: Int,
        startDate: Date,
        endDate: Date,
        includeManuallyAdded: Bool,
        anchorDate: Date
    ) -> HKStatisticsCollectionQuery {
        NSPredicate.dateRange(start: startDate, end: endDate).let {
            .init(
                quantityType: quantityType,
                quantitySamplePredicate: includeManuallyAdded
                    ? $0
                    : NSCompoundPredicate(andPredicateWithSubpredicates: [
                        .init(format: "metadata.%K == NO", HKMetadataKeyWasUserEntered),
                        $0,
                    ]),
                options: .cumulativeSum,
                anchorDate: anchorDate,
                intervalComponents: .init(minute: interval)
            )
        }
    }

    static func createAndExecuteQuery(
        quantityType: HKQuantityType,
        unit: HKUnit,
        interval: Int,
        startDate: Date,
        endDate: Date,
        isAscending: Bool,
        limit: Int,
        includeManuallyAdded: Bool,
        continuation: CheckedContinuation<[SimpleSample], Error>
    ) {
        guard
            let anchorDate = Calendar.current.date(from: Calendar.current.dateComponents(
                [.year, .month, .day, .hour, .minute, .second],
                from: startDate
            ))
        else {
            continuation.resume(throwing: HealthKitManager.Error.invalid(date: startDate))
            return
        }

        makeStatisticsCollectionQuery(
            quantityType: quantityType,
            interval: interval,
            startDate: startDate,
            endDate: endDate,
            includeManuallyAdded: includeManuallyAdded,
            anchorDate: anchorDate
        )
        .apply {
            $0.initialResultsHandler = {
                switchAndContinue(continuation: continuation, value: $1, error: $2) { statisticsCollection in
                    var samples: [SimpleSample] = []
                    statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                        if limit != HKObjectQueryNoLimit, samples.count > limit { stop.pointee = true }
                        statistics.sumQuantity()
                            .map { $0.doubleValue(for: unit) }
                            .map {
                                .init(
                                    value: $0,
                                    startDate: statistics.startDate.iso8601String,
                                    endDate: statistics.endDate.iso8601String
                                )
                            }
                            .map { samples.append($0) }
                    }

                    if !isAscending { samples = samples.reversed() }
                    return samples
                }
            }
        }
        .let(HealthKitManager.healthStore.execute)
    }
}
