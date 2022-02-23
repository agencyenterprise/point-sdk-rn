import HealthKit

extension HealthKitManager {
    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func _enableBackgroundDelivery<Query: HealthQuery>(
        queryFactory: @escaping () -> Query,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        let stubQuery = queryFactory()
        let (queryType, backgroundUpdateFrequency) = (stubQuery.queryType, stubQuery.backgroundUpdateFrequency)
        return try await withCheckedThrowingContinuation { continuation in
            Self.healthStore.enableBackgroundDelivery(
                for: queryType,
                frequency: backgroundUpdateFrequency
            ) { success, error in
                switchAndContinue(continuation: continuation, value: success, error: error) { value in
                    Self.healthStore.execute(
                        HKObserverQuery(
                            sampleType: queryType as! HKSampleType,
                            predicate: nil
                        ) { _, completionHandler, error in
                            Task {
                                do {
                                    if let error = error {
                                        updateHandler(.failure(error))
                                    } else {
                                        updateHandler(.success(try await _sync(query: queryFactory())))
                                    }
                                } catch {
                                    updateHandler(.failure(error))
                                }
                                completionHandler()
                            }
                        }
                    )

                    return value
                }
            }
        }
    }
}

public extension HealthKitManager {
    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> SleepQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> StepCountQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> HeartRateQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> HeartRateVariabilitySDNNQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> RestingHeartRateQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> ActiveEnergyBurnedQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> Vo2MaxQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> WorkoutQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> MindfulnessQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Enables background delivery for specific query and sync with database when new data arrives.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed when health kit has updates. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    func enableBackgroundDelivery(
        queryFactory: @escaping () -> BasalEnergyBurnedQuery,
        updateHandler: @escaping (_ result: Result<SyncResult, Swift.Error>) -> Void
    ) async throws -> Bool {
        try await _enableBackgroundDelivery(queryFactory: queryFactory, updateHandler: updateHandler)
    }

    /// Disables background delivery for specific query.
    /// - Parameter query: Query to be disabled.
    func disableBackgroundDelivery<Query: HealthQuery>(for query: Query) async throws {
        try await Self.healthStore.disableBackgroundDelivery(for: query.queryType)
    }

    /// Disables all background delivery queries.
    func disableAllBackgroundDelivery() async throws {
        try await Self.healthStore.disableAllBackgroundDelivery()
    }
}
