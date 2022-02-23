public struct Workout {
    let id: Int
    let calories: Double
    let distance: Double
    let duration: Double
    let start: String
    let end: String
    let activityName: String
    let activityId: Int?
    let ratings: WorkoutRatings?
}

public struct WorkoutRatings {
    let difficulty: Int?
    let energy: Int?
    let instructor: Int?
}

extension Workout {
    init?(apiWorkout: GetUserQuery.Data.User.LastWorkout) {
        self.init(
            id: apiWorkout.id,
            calories: apiWorkout.calories,
            distance: apiWorkout.distance,
            duration: apiWorkout.duration,
            start: apiWorkout.start,
            end: apiWorkout.end,
            activityName: apiWorkout.activityName,
            activityId: apiWorkout.activityId,
            ratings: apiWorkout.ratings != nil ? WorkoutRatings(
                difficulty: apiWorkout.ratings?.difficulty,
                energy: apiWorkout.ratings?.energy,
                instructor: apiWorkout.ratings?.instructor
            ) : nil
        )
    }
}
