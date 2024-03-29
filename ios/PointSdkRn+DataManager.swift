import Foundation
import PointSDK

@objc extension PointSdkRn {
  /**
   *  getUserData     Get user data
   *  @param resolve  Resolve handler
   *  @param reject   Reject handler
   */
  @objc
  func getUserData(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        let user = try await healthService?.getUserData()
        resolve(userMapping(user: user))
      } catch {
        reject("getUserData", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  setUserGoal     Set user goal
   *  @param goal     Goal
   *  @param resolve  Resolve handler
   *  @param reject   Reject handler
   */
  @objc
  func setUserGoal(_ goal: String, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        let mappedGoal = goalsMapping(type: goal)
        let result = try await healthService?.syncUserGoal(goal: mappedGoal)
        resolve(result)
      } catch {
        reject("setUserGoal", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  setUserSpecificGoal Set user specific goal
   *  @param specificGoal Specific goal
   *  @param resolve      Resolve handler
   *  @param reject       Reject handler
   */
  @objc
  func setUserSpecificGoal(_ specificGoal: String, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        let mappedSpecificGoal = specificGoalsMapping(type: specificGoal)
        let result = try await healthService?.syncUserSpecificGoal(specificGoal: mappedSpecificGoal)
        resolve(result)
      } catch {
        reject("setUserSpecificGoal", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  getUserWorkouts Retrieve workouts
   *  @param offset   Offset
   *  @param resolve  Resolve handler
   *  @param reject   Reject handler
   */
  @objc
  func getUserWorkouts(_ offset: Int, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        let workouts = try await healthService?.getUserWorkouts(offset: offset)
        resolve(workouts?.map{ workoutMapping(workout: $0) })
      } catch {
        reject("getUserWorkouts", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  getUserWorkoutById  Retrieve workout by ID
   *  @param id           Workout ID
   *  @param resolve      Resolve handler
   *  @param reject       Reject handler
   */
  @objc
  func getUserWorkoutById(_ id: Int, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        if let workout: Workout = try await healthService?.getWorkout(id: id) {
          resolve(workoutMapping(workout: workout))
        } else {
          resolve([])
        }
      } catch {
        reject("getUserWorkoutById", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  rateWorkout     Rate workout by ID
   *  @param Workout  Workout ID
   *  @param Rating[] Ratings
   *  @param resolve  Resolve handler
   *  @param reject   Reject handler
   */
  @objc
  func rateWorkout(_ id: Int, ratings: [String : Int], resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        if let workout = try await healthService?.getWorkout(id: id) {
          let ratings = WorkoutRatings(difficulty: ratings["difficulty"], energy: ratings["energy"], instructor: ratings["instructor"])
          let newWorkout = try await healthService?.rate(workout: workout, ratings: ratings)
          resolve(workoutMapping(workout: newWorkout))
        } else {
          resolve(false)
        }
      } catch {
        reject("getUserWorkoutById", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  getDailyHistory Retrieve daily history
   *  @param offset   Offset
   *  @param resolve  Resolve handler
   *  @param reject   Reject handler
   */
  @objc
  func getDailyHistory(_ offset: Int = 0, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        let workouts = try await healthService?.getDailyHistory(offset: offset)
        resolve(workouts?.map {
          [
            "date": $0.date,
            "metrics": $0.metrics.map { metricMapping(metric: $0) }
          ]
        })
      } catch {
        reject("getDailyHistory", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  getWorkoutRecommendations Retrieve workouts recommendations
   *  @param string               Date
   *  @param resolve            Resolve handler
   *  @param reject             Reject handler
   */
  @objc
  func getWorkoutRecommendations(_ date: String, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        let finalDate = date.fromIsoStringToDate()
        let recommendations = try await healthService?.getWorkoutRecommendations(date: finalDate)
        
        resolve(recommendations?.map { workoutRecommendationMapping(recommendation: $0) })
      } catch {
        reject("getWorkoutRecommendations", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  saveWorkoutRecommendation Save workout recommendation
   *  @param integer            Recommendation ID
   *  @param resolve            Resolve handler
   *  @param reject             Reject handler
   */
  @objc
  func saveWorkoutRecommendation(_ id: Int, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        let result = try await healthService?.saveWorkoutRecommendation(id: id)
        resolve(result)
      } catch {
        reject("saveWorkoutRecommendation", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  getHealthMetrics Retrieve health metrics
   *  @param object    Params
   *  @param resolve   Resolve handler
   *  @param reject    Reject handler
   */
  @objc
  func getHealthMetrics(_ params: [String : Any], resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        let filter = params["filter"] as? [String]
        let workoutId = params["workoutId"] as? Int
        let date = params["date"] as? String
        var healthMetrics = HealthMetric.HealthMetricType.allCases

        if let filter = filter {
          healthMetrics = filter.compactMap { HealthMetric.HealthMetricType(rawValue: $0) }
        }

        let data = try await healthService?.getHealthMetrics(
          types: Set(healthMetrics),
          workoutId: workoutId,
          date: date?.fromIsoStringToDate()
        )

        resolve(data?.map { metricMapping(metric: $0) })
      } catch {
        reject("getHealthMetrics", error.localizedDescription, error)
      }
    }
  }

  /**
   *  getInsights Retrieve user insights
   *  @param params    Params
   *  @param resolve   Resolve handler
   *  @param reject    Reject handler
   */
    @objc
    func getInsights(_ params: [String: Any], resolve:  @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        Task {
            do {
                let startDate = (params["from"] as? String)?.fromIsoStringToDate()
                let endDate = (params["to"] as? String)?.fromIsoStringToDate()
                let offset = params["offset"] as? Int
                guard let typesStrings = params["types"] as? [String], typesStrings.count > 0 else {
                    reject("getInsights", "You must provide at least one Insight type.", nil)
                    return
                }
                let types = typesStrings.compactMap{ InsightType(rawValue: $0) }
                let data = try await healthService?.getInsights(types: Set(types), from: startDate, to: endDate, offset: offset)
                resolve(data?.map { insightMapping(insight: $0) })
            } catch {
                reject("getInsights", error.localizedDescription, error)
            }
        }
    }
}
