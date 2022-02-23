public enum Goal: String {
    case athleticPerformance
    case weightLoss
}

extension Goal {
    init?(apiGoal: GoalAnswers) {
        switch apiGoal {
        case .athleticPerformance:
            self = .athleticPerformance
        case .weightLoss:
            self = .weightLoss
        case .__unknown:
            return nil
        }
    }
}
