import Combine
import Foundation

extension HealthKitManager {
    ///  Since iOS 13 implementation of `flatMap` didn't account for the fact that some publishers can't ever fail.
    ///  Need to inject a fake error to make it work for when `Publisher.Failure == Never`.
    private enum CombineFlatMapiOS13BridgeError: Swift.Error { case bridge }
    
    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func _listen<Query: HealthQuery>(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> Query?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        let timer = Timer.publish(every: timeInterval, on: .current, in: .default).autoconnect()
        func future(_ nothing: Any) -> Future<SyncResult?, Swift.Error> {
            Future {
                guard let query = queryFactory() else { return nil }
                return try await _sync(query: query)
            }
        }

        if #available(iOS 14.0, *) {
            return timer
                .flatMap(future)
                .compactMap { $0 }
                .eraseToAnyPublisher()
        } else {
            return timer.mapError { _ in CombineFlatMapiOS13BridgeError.bridge }
                .flatMap(future)
                .compactMap { $0 }
                .eraseToAnyPublisher()
        }
    }
}

public extension HealthKitManager {
    
    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> SleepQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }
    
    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> StepCountQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }

    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> HeartRateQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }

    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> HeartRateVariabilitySDNNQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }

    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> RestingHeartRateQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }

    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> ActiveEnergyBurnedQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }

    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> Vo2MaxQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }

    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> WorkoutQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }
    
    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> MindfulnessQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }

    /// Runs a recurring health query.
    /// - Parameter queryFactory: Factory closure that generates queries to be executed. Use this oportunity to adjust
    ///     the query parameters in between run cycles.
    /// - Parameter timeInterval: Time interval in secconds in between each run cycle.
    /// - Important: Make sure the returned publisher is subscribed to even if no side effects are needed.
    /// - Returns: Publisher with any potential errors on it's payload.
    ///     Can be used to assign any potential side effects after each run cycle.
    func listen(
        timeInterval: TimeInterval,
        queryFactory: @escaping () -> BasalEnergyBurnedQuery?
    ) -> AnyPublisher<SyncResult, Swift.Error> {
        _listen(timeInterval: timeInterval, queryFactory: queryFactory)
    }
}
