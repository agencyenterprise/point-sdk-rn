// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

internal struct CreateHealthSampleInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - data
  ///   - sampleType
  internal init(data: String, sampleType: HealthSampleType) {
    graphQLMap = ["data": data, "sampleType": sampleType]
  }

  internal var data: String {
    get {
      return graphQLMap["data"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "data")
    }
  }

  internal var sampleType: HealthSampleType {
    get {
      return graphQLMap["sampleType"] as! HealthSampleType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sampleType")
    }
  }
}

internal enum HealthSampleType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  internal typealias RawValue = String
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
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "restingHeartRate": self = .restingHeartRate
      case "heartRate": self = .heartRate
      case "activeEnergyBurned": self = .activeEnergyBurned
      case "basalEnergyBurned": self = .basalEnergyBurned
      case "workout": self = .workout
      case "heartRateVariabilitySDNN": self = .heartRateVariabilitySdnn
      case "vo2Max": self = .vo2Max
      case "stepCount": self = .stepCount
      case "mindfulSession": self = .mindfulSession
      case "sleepAnalysis": self = .sleepAnalysis
      default: self = .__unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .restingHeartRate: return "restingHeartRate"
      case .heartRate: return "heartRate"
      case .activeEnergyBurned: return "activeEnergyBurned"
      case .basalEnergyBurned: return "basalEnergyBurned"
      case .workout: return "workout"
      case .heartRateVariabilitySdnn: return "heartRateVariabilitySDNN"
      case .vo2Max: return "vo2Max"
      case .stepCount: return "stepCount"
      case .mindfulSession: return "mindfulSession"
      case .sleepAnalysis: return "sleepAnalysis"
      case .__unknown(let value): return value
    }
  }

  internal static func == (lhs: HealthSampleType, rhs: HealthSampleType) -> Bool {
    switch (lhs, rhs) {
      case (.restingHeartRate, .restingHeartRate): return true
      case (.heartRate, .heartRate): return true
      case (.activeEnergyBurned, .activeEnergyBurned): return true
      case (.basalEnergyBurned, .basalEnergyBurned): return true
      case (.workout, .workout): return true
      case (.heartRateVariabilitySdnn, .heartRateVariabilitySdnn): return true
      case (.vo2Max, .vo2Max): return true
      case (.stepCount, .stepCount): return true
      case (.mindfulSession, .mindfulSession): return true
      case (.sleepAnalysis, .sleepAnalysis): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  internal static var allCases: [HealthSampleType] {
    return [
      .restingHeartRate,
      .heartRate,
      .activeEnergyBurned,
      .basalEnergyBurned,
      .workout,
      .heartRateVariabilitySdnn,
      .vo2Max,
      .stepCount,
      .mindfulSession,
      .sleepAnalysis,
    ]
  }
}

internal enum HealthMetricType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  internal typealias RawValue = String
  case restingHr
  case oneMinuteHrr
  case threeMinuteHrr
  case hrv
  case vo2Max
  case activeCalories
  case basalCalories
  case totalCalories
  case workoutCalories
  case workoutDistance
  case workoutDuration
  case exertionRate
  case movementLevel
  case minsHrZone12
  case minsHrZone23
  case minsHrZone34
  case sleepDuration
  case mindfulMinutes
  case avgWorkoutHr
  case minWorkoutHr
  case maxWorkoutHr
  case totalWorkoutDuration
  case totalMinsHrZone12
  case totalMinsHrZone34
  case weeklyAvgWorkoutHr
  case weeklyExertionRate
  case dailyWorkoutDuration
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "RestingHR": self = .restingHr
      case "OneMinuteHRR": self = .oneMinuteHrr
      case "ThreeMinuteHRR": self = .threeMinuteHrr
      case "HRV": self = .hrv
      case "Vo2Max": self = .vo2Max
      case "ActiveCalories": self = .activeCalories
      case "BasalCalories": self = .basalCalories
      case "TotalCalories": self = .totalCalories
      case "WorkoutCalories": self = .workoutCalories
      case "WorkoutDistance": self = .workoutDistance
      case "WorkoutDuration": self = .workoutDuration
      case "ExertionRate": self = .exertionRate
      case "MovementLevel": self = .movementLevel
      case "MinsHRZone12": self = .minsHrZone12
      case "MinsHRZone23": self = .minsHrZone23
      case "MinsHRZone34": self = .minsHrZone34
      case "SleepDuration": self = .sleepDuration
      case "MindfulMinutes": self = .mindfulMinutes
      case "AvgWorkoutHR": self = .avgWorkoutHr
      case "MinWorkoutHR": self = .minWorkoutHr
      case "MaxWorkoutHR": self = .maxWorkoutHr
      case "TotalWorkoutDuration": self = .totalWorkoutDuration
      case "TotalMinsHRZone12": self = .totalMinsHrZone12
      case "TotalMinsHRZone34": self = .totalMinsHrZone34
      case "WeeklyAvgWorkoutHR": self = .weeklyAvgWorkoutHr
      case "WeeklyExertionRate": self = .weeklyExertionRate
      case "DailyWorkoutDuration": self = .dailyWorkoutDuration
      default: self = .__unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .restingHr: return "RestingHR"
      case .oneMinuteHrr: return "OneMinuteHRR"
      case .threeMinuteHrr: return "ThreeMinuteHRR"
      case .hrv: return "HRV"
      case .vo2Max: return "Vo2Max"
      case .activeCalories: return "ActiveCalories"
      case .basalCalories: return "BasalCalories"
      case .totalCalories: return "TotalCalories"
      case .workoutCalories: return "WorkoutCalories"
      case .workoutDistance: return "WorkoutDistance"
      case .workoutDuration: return "WorkoutDuration"
      case .exertionRate: return "ExertionRate"
      case .movementLevel: return "MovementLevel"
      case .minsHrZone12: return "MinsHRZone12"
      case .minsHrZone23: return "MinsHRZone23"
      case .minsHrZone34: return "MinsHRZone34"
      case .sleepDuration: return "SleepDuration"
      case .mindfulMinutes: return "MindfulMinutes"
      case .avgWorkoutHr: return "AvgWorkoutHR"
      case .minWorkoutHr: return "MinWorkoutHR"
      case .maxWorkoutHr: return "MaxWorkoutHR"
      case .totalWorkoutDuration: return "TotalWorkoutDuration"
      case .totalMinsHrZone12: return "TotalMinsHRZone12"
      case .totalMinsHrZone34: return "TotalMinsHRZone34"
      case .weeklyAvgWorkoutHr: return "WeeklyAvgWorkoutHR"
      case .weeklyExertionRate: return "WeeklyExertionRate"
      case .dailyWorkoutDuration: return "DailyWorkoutDuration"
      case .__unknown(let value): return value
    }
  }

  internal static func == (lhs: HealthMetricType, rhs: HealthMetricType) -> Bool {
    switch (lhs, rhs) {
      case (.restingHr, .restingHr): return true
      case (.oneMinuteHrr, .oneMinuteHrr): return true
      case (.threeMinuteHrr, .threeMinuteHrr): return true
      case (.hrv, .hrv): return true
      case (.vo2Max, .vo2Max): return true
      case (.activeCalories, .activeCalories): return true
      case (.basalCalories, .basalCalories): return true
      case (.totalCalories, .totalCalories): return true
      case (.workoutCalories, .workoutCalories): return true
      case (.workoutDistance, .workoutDistance): return true
      case (.workoutDuration, .workoutDuration): return true
      case (.exertionRate, .exertionRate): return true
      case (.movementLevel, .movementLevel): return true
      case (.minsHrZone12, .minsHrZone12): return true
      case (.minsHrZone23, .minsHrZone23): return true
      case (.minsHrZone34, .minsHrZone34): return true
      case (.sleepDuration, .sleepDuration): return true
      case (.mindfulMinutes, .mindfulMinutes): return true
      case (.avgWorkoutHr, .avgWorkoutHr): return true
      case (.minWorkoutHr, .minWorkoutHr): return true
      case (.maxWorkoutHr, .maxWorkoutHr): return true
      case (.totalWorkoutDuration, .totalWorkoutDuration): return true
      case (.totalMinsHrZone12, .totalMinsHrZone12): return true
      case (.totalMinsHrZone34, .totalMinsHrZone34): return true
      case (.weeklyAvgWorkoutHr, .weeklyAvgWorkoutHr): return true
      case (.weeklyExertionRate, .weeklyExertionRate): return true
      case (.dailyWorkoutDuration, .dailyWorkoutDuration): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  internal static var allCases: [HealthMetricType] {
    return [
      .restingHr,
      .oneMinuteHrr,
      .threeMinuteHrr,
      .hrv,
      .vo2Max,
      .activeCalories,
      .basalCalories,
      .totalCalories,
      .workoutCalories,
      .workoutDistance,
      .workoutDuration,
      .exertionRate,
      .movementLevel,
      .minsHrZone12,
      .minsHrZone23,
      .minsHrZone34,
      .sleepDuration,
      .mindfulMinutes,
      .avgWorkoutHr,
      .minWorkoutHr,
      .maxWorkoutHr,
      .totalWorkoutDuration,
      .totalMinsHrZone12,
      .totalMinsHrZone34,
      .weeklyAvgWorkoutHr,
      .weeklyExertionRate,
      .dailyWorkoutDuration,
    ]
  }
}

internal enum GoalAnswers: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  internal typealias RawValue = String
  case athleticPerformance
  case weightLoss
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "athleticPerformance": self = .athleticPerformance
      case "weightLoss": self = .weightLoss
      default: self = .__unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .athleticPerformance: return "athleticPerformance"
      case .weightLoss: return "weightLoss"
      case .__unknown(let value): return value
    }
  }

  internal static func == (lhs: GoalAnswers, rhs: GoalAnswers) -> Bool {
    switch (lhs, rhs) {
      case (.athleticPerformance, .athleticPerformance): return true
      case (.weightLoss, .weightLoss): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  internal static var allCases: [GoalAnswers] {
    return [
      .athleticPerformance,
      .weightLoss,
    ]
  }
}

internal enum SpecificGoalAnswers: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  internal typealias RawValue = String
  case buildLeanMuscle
  case loseWeight
  case prepareForEvent
  case accomplishMore
  case maintainHealth
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "buildLeanMuscle": self = .buildLeanMuscle
      case "loseWeight": self = .loseWeight
      case "prepareForEvent": self = .prepareForEvent
      case "accomplishMore": self = .accomplishMore
      case "maintainHealth": self = .maintainHealth
      default: self = .__unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .buildLeanMuscle: return "buildLeanMuscle"
      case .loseWeight: return "loseWeight"
      case .prepareForEvent: return "prepareForEvent"
      case .accomplishMore: return "accomplishMore"
      case .maintainHealth: return "maintainHealth"
      case .__unknown(let value): return value
    }
  }

  internal static func == (lhs: SpecificGoalAnswers, rhs: SpecificGoalAnswers) -> Bool {
    switch (lhs, rhs) {
      case (.buildLeanMuscle, .buildLeanMuscle): return true
      case (.loseWeight, .loseWeight): return true
      case (.prepareForEvent, .prepareForEvent): return true
      case (.accomplishMore, .accomplishMore): return true
      case (.maintainHealth, .maintainHealth): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  internal static var allCases: [SpecificGoalAnswers] {
    return [
      .buildLeanMuscle,
      .loseWeight,
      .prepareForEvent,
      .accomplishMore,
      .maintainHealth,
    ]
  }
}

internal final class CreateHealthSampleMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  internal let operationDefinition: String =
    """
    mutation createHealthSample($input: CreateHealthSampleInput!) {
      createHealthSample(input: $input) {
        __typename
        success
      }
    }
    """

  internal let operationName: String = "createHealthSample"

  internal var input: CreateHealthSampleInput

  internal init(input: CreateHealthSampleInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes: [String] = ["Mutation"]

    internal static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createHealthSample", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CreateHealthSample.selections))),
      ]
    }

    internal private(set) var resultMap: ResultMap

    internal init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    internal init(createHealthSample: CreateHealthSample) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createHealthSample": createHealthSample.resultMap])
    }

    internal var createHealthSample: CreateHealthSample {
      get {
        return CreateHealthSample(unsafeResultMap: resultMap["createHealthSample"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createHealthSample")
      }
    }

    internal struct CreateHealthSample: GraphQLSelectionSet {
      internal static let possibleTypes: [String] = ["CreateHealthSamplePayload"]

      internal static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      internal private(set) var resultMap: ResultMap

      internal init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      internal init(success: Bool) {
        self.init(unsafeResultMap: ["__typename": "CreateHealthSamplePayload", "success": success])
      }

      internal var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var success: Bool {
        get {
          return resultMap["success"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}

internal final class GetHealthMetricsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  internal let operationDefinition: String =
    """
    query getHealthMetrics($filter: [HealthMetricType!]!, $workoutId: Int, $date: DateTime) {
      healthMetrics(filter: $filter, workoutId: $workoutId, date: $date) {
        __typename
        type
        date
        value
        variance
        workoutId
      }
    }
    """

  internal let operationName: String = "getHealthMetrics"

  internal var filter: [HealthMetricType]
  internal var workoutId: Int?
  internal var date: String?

  internal init(filter: [HealthMetricType], workoutId: Int? = nil, date: String? = nil) {
    self.filter = filter
    self.workoutId = workoutId
    self.date = date
  }

  internal var variables: GraphQLMap? {
    return ["filter": filter, "workoutId": workoutId, "date": date]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes: [String] = ["Query"]

    internal static var selections: [GraphQLSelection] {
      return [
        GraphQLField("healthMetrics", arguments: ["filter": GraphQLVariable("filter"), "workoutId": GraphQLVariable("workoutId"), "date": GraphQLVariable("date")], type: .nonNull(.list(.nonNull(.object(HealthMetric.selections))))),
      ]
    }

    internal private(set) var resultMap: ResultMap

    internal init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    internal init(healthMetrics: [HealthMetric]) {
      self.init(unsafeResultMap: ["__typename": "Query", "healthMetrics": healthMetrics.map { (value: HealthMetric) -> ResultMap in value.resultMap }])
    }

    internal var healthMetrics: [HealthMetric] {
      get {
        return (resultMap["healthMetrics"] as! [ResultMap]).map { (value: ResultMap) -> HealthMetric in HealthMetric(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: HealthMetric) -> ResultMap in value.resultMap }, forKey: "healthMetrics")
      }
    }

    internal struct HealthMetric: GraphQLSelectionSet {
      internal static let possibleTypes: [String] = ["HealthMetricPayload"]

      internal static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(HealthMetricType.self))),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .scalar(String.self)),
          GraphQLField("variance", type: .scalar(Int.self)),
          GraphQLField("workoutId", type: .scalar(Int.self)),
        ]
      }

      internal private(set) var resultMap: ResultMap

      internal init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      internal init(type: HealthMetricType, date: String, value: String? = nil, variance: Int? = nil, workoutId: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "HealthMetricPayload", "type": type, "date": date, "value": value, "variance": variance, "workoutId": workoutId])
      }

      internal var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var type: HealthMetricType {
        get {
          return resultMap["type"]! as! HealthMetricType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      internal var date: String {
        get {
          return resultMap["date"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      internal var value: String? {
        get {
          return resultMap["value"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "value")
        }
      }

      internal var variance: Int? {
        get {
          return resultMap["variance"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "variance")
        }
      }

      internal var workoutId: Int? {
        get {
          return resultMap["workoutId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "workoutId")
        }
      }
    }
  }
}

internal final class GetUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  internal let operationDefinition: String =
    """
    query getUser {
      user {
        __typename
        id
        email
        firstName
        goal
        specificGoal
        birthday
        goalProgress {
          __typename
          overall {
            __typename
            value
            variance
          }
          endurance {
            __typename
            value
            variance
          }
          recovery {
            __typename
            value
            variance
          }
          strength {
            __typename
            value
            variance
          }
        }
        lastWorkout {
          __typename
          id
          calories
          distance
          duration
          start
          end
          activityName
          activityId
          ratings {
            __typename
            difficulty
            energy
            instructor
          }
        }
        isSubscriber
      }
    }
    """

  internal let operationName: String = "getUser"

  internal init() {
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes: [String] = ["Query"]

    internal static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", type: .object(User.selections)),
      ]
    }

    internal private(set) var resultMap: ResultMap

    internal init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    internal init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    internal var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    internal struct User: GraphQLSelectionSet {
      internal static let possibleTypes: [String] = ["User"]

      internal static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("goal", type: .scalar(GoalAnswers.self)),
          GraphQLField("specificGoal", type: .scalar(SpecificGoalAnswers.self)),
          GraphQLField("birthday", type: .scalar(String.self)),
          GraphQLField("goalProgress", type: .nonNull(.object(GoalProgress.selections))),
          GraphQLField("lastWorkout", type: .object(LastWorkout.selections)),
          GraphQLField("isSubscriber", type: .scalar(Bool.self)),
        ]
      }

      internal private(set) var resultMap: ResultMap

      internal init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      internal init(id: String, email: String? = nil, firstName: String? = nil, goal: GoalAnswers? = nil, specificGoal: SpecificGoalAnswers? = nil, birthday: String? = nil, goalProgress: GoalProgress, lastWorkout: LastWorkout? = nil, isSubscriber: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "firstName": firstName, "goal": goal, "specificGoal": specificGoal, "birthday": birthday, "goalProgress": goalProgress.resultMap, "lastWorkout": lastWorkout.flatMap { (value: LastWorkout) -> ResultMap in value.resultMap }, "isSubscriber": isSubscriber])
      }

      internal var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      internal var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      internal var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      internal var goal: GoalAnswers? {
        get {
          return resultMap["goal"] as? GoalAnswers
        }
        set {
          resultMap.updateValue(newValue, forKey: "goal")
        }
      }

      internal var specificGoal: SpecificGoalAnswers? {
        get {
          return resultMap["specificGoal"] as? SpecificGoalAnswers
        }
        set {
          resultMap.updateValue(newValue, forKey: "specificGoal")
        }
      }

      internal var birthday: String? {
        get {
          return resultMap["birthday"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "birthday")
        }
      }

      internal var goalProgress: GoalProgress {
        get {
          return GoalProgress(unsafeResultMap: resultMap["goalProgress"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "goalProgress")
        }
      }

      internal var lastWorkout: LastWorkout? {
        get {
          return (resultMap["lastWorkout"] as? ResultMap).flatMap { LastWorkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "lastWorkout")
        }
      }

      internal var isSubscriber: Bool? {
        get {
          return resultMap["isSubscriber"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isSubscriber")
        }
      }

      internal struct GoalProgress: GraphQLSelectionSet {
        internal static let possibleTypes: [String] = ["GoalProgressPayload"]

        internal static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("overall", type: .nonNull(.object(Overall.selections))),
            GraphQLField("endurance", type: .nonNull(.object(Endurance.selections))),
            GraphQLField("recovery", type: .nonNull(.object(Recovery.selections))),
            GraphQLField("strength", type: .nonNull(.object(Strength.selections))),
          ]
        }

        internal private(set) var resultMap: ResultMap

        internal init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        internal init(overall: Overall, endurance: Endurance, recovery: Recovery, strength: Strength) {
          self.init(unsafeResultMap: ["__typename": "GoalProgressPayload", "overall": overall.resultMap, "endurance": endurance.resultMap, "recovery": recovery.resultMap, "strength": strength.resultMap])
        }

        internal var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var overall: Overall {
          get {
            return Overall(unsafeResultMap: resultMap["overall"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "overall")
          }
        }

        internal var endurance: Endurance {
          get {
            return Endurance(unsafeResultMap: resultMap["endurance"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "endurance")
          }
        }

        internal var recovery: Recovery {
          get {
            return Recovery(unsafeResultMap: resultMap["recovery"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "recovery")
          }
        }

        internal var strength: Strength {
          get {
            return Strength(unsafeResultMap: resultMap["strength"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "strength")
          }
        }

        internal struct Overall: GraphQLSelectionSet {
          internal static let possibleTypes: [String] = ["GoalProgressItem"]

          internal static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .nonNull(.scalar(Double.self))),
              GraphQLField("variance", type: .scalar(Double.self)),
            ]
          }

          internal private(set) var resultMap: ResultMap

          internal init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          internal init(value: Double, variance: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "GoalProgressItem", "value": value, "variance": variance])
          }

          internal var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var value: Double {
            get {
              return resultMap["value"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          internal var variance: Double? {
            get {
              return resultMap["variance"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "variance")
            }
          }
        }

        internal struct Endurance: GraphQLSelectionSet {
          internal static let possibleTypes: [String] = ["GoalProgressItem"]

          internal static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .nonNull(.scalar(Double.self))),
              GraphQLField("variance", type: .scalar(Double.self)),
            ]
          }

          internal private(set) var resultMap: ResultMap

          internal init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          internal init(value: Double, variance: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "GoalProgressItem", "value": value, "variance": variance])
          }

          internal var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var value: Double {
            get {
              return resultMap["value"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          internal var variance: Double? {
            get {
              return resultMap["variance"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "variance")
            }
          }
        }

        internal struct Recovery: GraphQLSelectionSet {
          internal static let possibleTypes: [String] = ["GoalProgressItem"]

          internal static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .nonNull(.scalar(Double.self))),
              GraphQLField("variance", type: .scalar(Double.self)),
            ]
          }

          internal private(set) var resultMap: ResultMap

          internal init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          internal init(value: Double, variance: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "GoalProgressItem", "value": value, "variance": variance])
          }

          internal var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var value: Double {
            get {
              return resultMap["value"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          internal var variance: Double? {
            get {
              return resultMap["variance"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "variance")
            }
          }
        }

        internal struct Strength: GraphQLSelectionSet {
          internal static let possibleTypes: [String] = ["GoalProgressItem"]

          internal static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .nonNull(.scalar(Double.self))),
              GraphQLField("variance", type: .scalar(Double.self)),
            ]
          }

          internal private(set) var resultMap: ResultMap

          internal init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          internal init(value: Double, variance: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "GoalProgressItem", "value": value, "variance": variance])
          }

          internal var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var value: Double {
            get {
              return resultMap["value"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          internal var variance: Double? {
            get {
              return resultMap["variance"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "variance")
            }
          }
        }
      }

      internal struct LastWorkout: GraphQLSelectionSet {
        internal static let possibleTypes: [String] = ["Workout"]

        internal static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("calories", type: .nonNull(.scalar(Double.self))),
            GraphQLField("distance", type: .nonNull(.scalar(Double.self))),
            GraphQLField("duration", type: .nonNull(.scalar(Double.self))),
            GraphQLField("start", type: .nonNull(.scalar(String.self))),
            GraphQLField("end", type: .nonNull(.scalar(String.self))),
            GraphQLField("activityName", type: .nonNull(.scalar(String.self))),
            GraphQLField("activityId", type: .scalar(Int.self)),
            GraphQLField("ratings", type: .object(Rating.selections)),
          ]
        }

        internal private(set) var resultMap: ResultMap

        internal init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        internal init(id: Int, calories: Double, distance: Double, duration: Double, start: String, end: String, activityName: String, activityId: Int? = nil, ratings: Rating? = nil) {
          self.init(unsafeResultMap: ["__typename": "Workout", "id": id, "calories": calories, "distance": distance, "duration": duration, "start": start, "end": end, "activityName": activityName, "activityId": activityId, "ratings": ratings.flatMap { (value: Rating) -> ResultMap in value.resultMap }])
        }

        internal var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        internal var calories: Double {
          get {
            return resultMap["calories"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "calories")
          }
        }

        internal var distance: Double {
          get {
            return resultMap["distance"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "distance")
          }
        }

        internal var duration: Double {
          get {
            return resultMap["duration"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "duration")
          }
        }

        internal var start: String {
          get {
            return resultMap["start"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "start")
          }
        }

        internal var end: String {
          get {
            return resultMap["end"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "end")
          }
        }

        internal var activityName: String {
          get {
            return resultMap["activityName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "activityName")
          }
        }

        internal var activityId: Int? {
          get {
            return resultMap["activityId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "activityId")
          }
        }

        internal var ratings: Rating? {
          get {
            return (resultMap["ratings"] as? ResultMap).flatMap { Rating(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "ratings")
          }
        }

        internal struct Rating: GraphQLSelectionSet {
          internal static let possibleTypes: [String] = ["WorkoutRatings"]

          internal static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("difficulty", type: .scalar(Int.self)),
              GraphQLField("energy", type: .scalar(Int.self)),
              GraphQLField("instructor", type: .scalar(Int.self)),
            ]
          }

          internal private(set) var resultMap: ResultMap

          internal init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          internal init(difficulty: Int? = nil, energy: Int? = nil, instructor: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "WorkoutRatings", "difficulty": difficulty, "energy": energy, "instructor": instructor])
          }

          internal var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var difficulty: Int? {
            get {
              return resultMap["difficulty"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "difficulty")
            }
          }

          internal var energy: Int? {
            get {
              return resultMap["energy"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "energy")
            }
          }

          internal var instructor: Int? {
            get {
              return resultMap["instructor"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "instructor")
            }
          }
        }
      }
    }
  }
}

internal final class SetUserBirthdayMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  internal let operationDefinition: String =
    """
    mutation setUserBirthday($input: DateTime!) {
      setUserBirthday(date: $input) {
        __typename
        success
      }
    }
    """

  internal let operationName: String = "setUserBirthday"

  internal var input: String

  internal init(input: String) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes: [String] = ["Mutation"]

    internal static var selections: [GraphQLSelection] {
      return [
        GraphQLField("setUserBirthday", arguments: ["date": GraphQLVariable("input")], type: .nonNull(.object(SetUserBirthday.selections))),
      ]
    }

    internal private(set) var resultMap: ResultMap

    internal init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    internal init(setUserBirthday: SetUserBirthday) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "setUserBirthday": setUserBirthday.resultMap])
    }

    internal var setUserBirthday: SetUserBirthday {
      get {
        return SetUserBirthday(unsafeResultMap: resultMap["setUserBirthday"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "setUserBirthday")
      }
    }

    internal struct SetUserBirthday: GraphQLSelectionSet {
      internal static let possibleTypes: [String] = ["UserBirthdayPayload"]

      internal static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      internal private(set) var resultMap: ResultMap

      internal init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      internal init(success: Bool) {
        self.init(unsafeResultMap: ["__typename": "UserBirthdayPayload", "success": success])
      }

      internal var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var success: Bool {
        get {
          return resultMap["success"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}
