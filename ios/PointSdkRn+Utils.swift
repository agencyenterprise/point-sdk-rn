import Foundation
import PointSDK

extension Date {
  func toIsoString() -> String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return formatter.string(from: self)
  }
}

extension String {
  func fromIsoStringToDate() -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return formatter.date(from: self)!
  }
}

extension PointSdkRn {

  func goalsMapping(type: String) -> Goal {
    switch type {
    case "athleticPerformance":
      return .athleticPerformance
    case "weightLoss":
      return .weightLoss
    default:
      return .weightLoss
    }
  }

  func specificGoalsMapping(type: String) -> SpecificGoal {
    switch type {
    case "buildLeanMuscle":
      return .buildLeanMuscle
    case "loseWeight":
      return .loseWeight
    case "prepareForEvent":
      return .prepareForEvent
    case "accomplishMore":
      return .accomplishMore
    case "maintainHealth":
      return .maintainHealth
    default:
      return .buildLeanMuscle
    }
  }

  func environmentsMapping(type: String) -> APIEnvironment {
    switch type {
    case "development":
      return .development
    case "staging":
      return .staging
    case "production":
      return .production
    case "preprod":
      return .preprod
    default:
      return .development
    }
  }
    
  func fitbitScopesMapping(type: String?) -> FitbitScopes? {
    guard let scope = type else { return nil }
    
    return FitbitScopes.init(rawValue: scope)
  }

  func workoutMapping(workout: Workout?) -> [String : Any] {
    guard let workout = workout else { return [:] }
    
    return [
      "id": workout.id,
      "calories": workout.calories,
      "distance": workout.distance,
      "duration": workout.duration,
      "start": workout.start,
      "end": workout.end,
      "activityName": workout.activityName,
      "activityId": workout.activityId as Any,
      "ratings": [
        "difficulty": workout.ratings?.difficulty,
        "energy": workout.ratings?.energy,
        "instructor": workout.ratings?.instructor,
      ]
    ]
  }

  func goalProgressMapping(goalProgress: GoalProgress) -> [String : Any] {
    [
      "overral": [
        "value": goalProgress.overral.value,
        "variance": goalProgress.overral.variance
      ],
      "endurance": [
        "value": goalProgress.endurance.value,
        "variance": goalProgress.endurance.variance
      ],
      "recovery": [
        "value": goalProgress.recovery.value,
        "variance": goalProgress.recovery.variance
      ],
      "strength": [
        "value": goalProgress.strength.value,
        "variance": goalProgress.strength.variance
      ]
    ]
  }

  func userMapping(user: User?) -> [String : Any] {
    guard let user = user else { return [:] }

    return [
      "id": user.id,
      "email": user.email as Any,
      "birthday": user.birthday as Any,
      "firstName": user.firstName as Any,
      "isSubscriber": user.isSubscriber as Any,
      "goal": user.goal?.rawValue as Any,
      "goalProgress": goalProgressMapping(goalProgress: user.goalProgress),
      "specificGoal": user.specificGoal?.rawValue as Any,
      "lastWorkout": workoutMapping(workout: user.lastWorkout)
    ]
  }
  
  func metricMapping(metric: HealthMetric?) -> [String : Any] {
    guard let metric = metric else { return [:] }

    return [
      "type": metric.type,
      "date": metric.date,
      "value": metric.value,
      "variance": metric.variance as Any,
      "workoutId": metric.workoutId as Any
    ]
  }
  
  func workoutRecommendationMapping(recommendation: WorkoutRecommendation?) -> [String : Any] {
    guard let recommendation = recommendation else { return [:] }
    
    return [
      "id": recommendation.id,
      "date": recommendation.date as Any,
      "activityId": recommendation.activityId as Any,
      "activityName": recommendation.activityName as Any,
      "workoutId": recommendation.workoutId as Any,
      "completedAt": recommendation.completedAt as Any,
      "createdAt": recommendation.createdAt as Any,
      "savedAt": recommendation.savedAt as Any
    ]
  }
}
