public enum SpecificGoal: String {
    case buildLeanMuscle
    case loseWeight
    case prepareForEvent
    case accomplishMore
    case maintainHealth
}

extension SpecificGoal {
    init?(apiGoal: SpecificGoalAnswers) {
        switch apiGoal {
        case .buildLeanMuscle:
            self = .buildLeanMuscle
        case .loseWeight:
            self = .loseWeight
        case .prepareForEvent:
            self = .prepareForEvent
        case .accomplishMore:
            self = .accomplishMore
        case .maintainHealth:
            self = .maintainHealth
        case .__unknown:
            return nil
        }
    }
}
