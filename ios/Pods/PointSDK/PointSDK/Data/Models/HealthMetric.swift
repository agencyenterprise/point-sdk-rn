// MARK: - HealthMetric

public struct HealthMetric: Hashable {
    public let type: String
    public let date: String
    public let value: String
    public let variance: Int?
    public let workoutId: Int?
}

public extension HealthMetric {
    enum Kind: String, CaseIterable {
        case restingHr = "RestingHR"
        case oneMinuteHrr = "OneMinuteHRR"
        case threeMinuteHrr = "ThreeMinuteHRR"
        case hrv = "HRV"
        case vo2Max = "Vo2Max"
        case activeCalories = "ActiveCalories"
        case basalCalories = "BasalCalories"
        case totalCalories = "TotalCalories"
        case workoutCalories = "WorkoutCalories"
        case workoutDistance = "WorkoutDistance"
        case workoutDuration = "WorkoutDuration"
        case exertionRate = "ExertionRate"
        case movementLevel = "MovementLevel"
        case minsHrZone12 = "MinsHRZone12"
        case minsHrZone23 = "MinsHRZone23"
        case minsHrZone34 = "MinsHRZone34"
        case sleepDuration = "SleepDuration"
        case mindfulMinutes = "MindfulMinutes"
        case avgWorkoutHr = "AvgWorkoutHR"
        case minWorkoutHr = "MinWorkoutHR"
        case maxWorkoutHr = "MaxWorkoutHR"
        case totalWorkoutDuration = "TotalWorkoutDuration"
        case totalMinsHrZone12 = "TotalMinsHRZone12"
        case totalMinsHrZone34 = "TotalMinsHRZone34"
        case weeklyAvgWorkoutHr = "WeeklyAvgWorkoutHR"
        case weeklyExertionRate = "WeeklyExertionRate"
        case dailyWorkoutDuration = "DailyWorkoutDuration"
    }
}

extension HealthMetric {
    init(_ queryData: GetHealthMetricsQuery.Data.HealthMetric) {
        self.init(
            type: queryData.type.rawValue,
            date: queryData.date,
            value: queryData.value ?? "",
            variance: queryData.variance,
            workoutId: queryData.workoutId
        )
    }
}
