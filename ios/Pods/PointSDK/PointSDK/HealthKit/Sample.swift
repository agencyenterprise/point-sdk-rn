import HealthKit

// MARK: - SimpleSample

public struct SimpleSample: Hashable, Encodable {
    public let value: Double
    public let startDate: String
    public let endDate: String
}

// MARK: - QuantitySample

public struct QuantitySample: Hashable, Encodable, Identifiable {
    let value: Double
    public let id: UUID
    let sourceName: String
    let sourceID: String
    let startDate: String
    let endDate: String
    let metadata: [String: String]
}

// MARK: - QualitySample

public struct QualitySample: Hashable, Encodable, Identifiable {
    let value: String
    public let id: UUID
    let sourceName: String
    let sourceID: String
    let startDate: String
    let endDate: String
    let metadata: [String: String]
}

// MARK: - DateRangeSample

public struct DateRangeSample: Hashable, Encodable {
    let startDate: String
    let endDate: String
}

// MARK: - TrackedValueSample

public struct TrackedValueSample: Hashable, Encodable {
    var value: Double
    let tracked: Bool
    let sourceName: String
    let sourceId: String
    let device: String?
    let start: String
    let end: String
}

// MARK: - WorkoutSample

public struct WorkoutSample: Hashable, Encodable, Identifiable {
    public let id: String
    let activityId: Int
    let activityName: String
    let calories: Double
    let tracked: Bool
    let metadata: [String: String]
    let sourceName: String
    let sourceId: String
    let device: String?
    let distance: Double
    let start: String
    let end: String
}
