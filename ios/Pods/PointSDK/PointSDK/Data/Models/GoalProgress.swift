public struct GoalProgress {
    let overral: GoalProgressItem
    let endurance: GoalProgressItem
    let recovery: GoalProgressItem
    let strength: GoalProgressItem
}

public struct GoalProgressItem {
    let value: Double?
    let variance: Double?
}

extension GoalProgress {
    init(apiGoalProgress: GetUserQuery.Data.User.GoalProgress) {
        self.init(
            overral: GoalProgressItem(
                value: apiGoalProgress.overall.value,
                variance: apiGoalProgress.overall.variance
            ),
            endurance: GoalProgressItem(
                value: apiGoalProgress.endurance.value,
                variance: apiGoalProgress.overall.variance
            ),
            recovery: GoalProgressItem(
                value: apiGoalProgress.recovery.value,
                variance: apiGoalProgress.overall.variance
            ),
            strength: GoalProgressItem(
                value: apiGoalProgress.strength.value,
                variance: apiGoalProgress.overall.variance
            )
        )
    }
}
