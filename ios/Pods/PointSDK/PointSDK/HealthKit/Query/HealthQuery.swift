import Foundation
import HealthKit

// MARK: - HealthQuery

/// Don't implement this protocol.
public protocol HealthQuery {
    associatedtype Return: Encodable
    associatedtype ObjectType: HKObjectType

    var sampleType: HealthQuerySampleType { get }
    var queryType: ObjectType { get }

    // (Apple)[https://developer.apple.com/documentation/healthkit/hkhealthstore/1614175-enablebackgrounddelivery]
    //  enforces update frequency according to the type, cannot be open to the user to customize.
    var backgroundUpdateFrequency: HKUpdateFrequency { get }

    func fetch() async throws -> Return
}

// MARK: - HealthQuerySampleType

public enum HealthQuerySampleType: String {
    case restingHeartRate
    case heartRate
    case activeEnergyBurned
    case basalEnergyBurned
    case workout
    case heartRateVariabilitySdnn
    case vo2Max
    case stepCount
    case mindfulSession
    case sleepAnalysis
}

public extension HealthQuery where Self == MindfulnessQuery {
    static func mindfulness(
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit
    ) -> Self {
        Self(startDate: startDate, endDate: endDate, isAscending: isAscending, limit: limit)
    }
}

public extension HealthQuery where Self == SleepQuery {
    static func sleep(
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit
    ) -> Self {
        Self(startDate: startDate, endDate: endDate, isAscending: isAscending, limit: limit)
    }
}

public extension HealthQuery where Self == Vo2MaxQuery {
    static func vo2Max(
        unit: HKUnit = .literUnit(with: .milli).unitDivided(by: .gramUnit(with: .kilo).unitMultiplied(by: .minute())),
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit
    ) -> Self {
        Self(unit: unit, startDate: startDate, endDate: endDate, isAscending: isAscending, limit: limit)
    }
}

public extension HealthQuery where Self == HeartRateQuery {
    static func heartRate(
        unit: HKUnit = .count().unitDivided(by: .minute()),
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit
    ) -> Self {
        Self(unit: unit, startDate: startDate, endDate: endDate, isAscending: isAscending, limit: limit)
    }
}

public extension HealthQuery where Self == RestingHeartRateQuery {
    static func restingHeartRate(
        unit: HKUnit = .count().unitDivided(by: .minute()),
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit
    ) -> Self {
        Self(unit: unit, startDate: startDate, endDate: endDate, isAscending: isAscending, limit: limit)
    }
}

public extension HealthQuery where Self == HeartRateVariabilitySDNNQuery {
    static func heartRateVariabilitySDNN(
        unit: HKUnit = .second(),
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit
    ) -> Self {
        Self(unit: unit, startDate: startDate, endDate: endDate, isAscending: isAscending, limit: limit)
    }
}

public extension HealthQuery where Self == ActiveEnergyBurnedQuery {
    static func activeEnergyBurned(
        unit: HKUnit = .kilocalorie(),
        interval: Int = 60,
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit,
        includeManuallyAdded: Bool = true
    ) -> Self {
        Self(
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

public extension HealthQuery where Self == BasalEnergyBurnedQuery {
    static func basalEnergyBurned(
        unit: HKUnit = .kilocalorie(),
        interval: Int = 60,
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit,
        includeManuallyAdded: Bool = true
    ) -> Self {
        Self(
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

public extension HealthQuery where Self == StepCountQuery {
    static func stepCount(
        startDate: Date,
        endDate: Date = Date(),
        interval: Int = 60,
        includeManuallyAdded: Bool = true
    ) -> Self {
        Self(startDate: startDate, endDate: endDate, interval: interval, includeManuallyAdded: includeManuallyAdded)
    }
}

public extension HealthQuery where Self == WorkoutQuery {
    static func workout(
        startDate: Date,
        endDate: Date = .init(),
        isAscending: Bool = true,
        limit: Int = HKObjectQueryNoLimit
    ) -> Self {
        Self(startDate: startDate, endDate: endDate, isAscending: isAscending, limit: limit)
    }
}
