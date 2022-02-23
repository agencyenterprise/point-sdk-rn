public struct User {
    public let id: String
    public let email: String?
    public let birthday: String?
    public let firstName: String?
    public let isSubscriber: Bool?
    public let goal: Goal?
    public let goalProgress: GoalProgress
    public let specificGoal: SpecificGoal?
    public let lastWorkout: Workout?
}

extension User {
    init(apiUser: GetUserQuery.Data.User) {
        self.init(
            id: apiUser.id,
            email: apiUser.email,
            birthday: apiUser.birthday,
            firstName: apiUser.firstName,
            isSubscriber: apiUser.isSubscriber,
            goal: apiUser.goal.flatMap(Goal.init),
            goalProgress: .init(apiGoalProgress: apiUser.goalProgress),
            specificGoal: apiUser.specificGoal.flatMap(SpecificGoal.init),
            lastWorkout: apiUser.lastWorkout.flatMap(Workout.init)
        )
    }
}
