// main index.js

import { NativeModules } from "react-native";
const { PointSdkRn } = NativeModules;

export const QueryType = {
  RestingHeartRate: "restingHeartRate",
  HeartRate: "heartRate",
  ActiveEnergyBurned: "activeEnergyBurned",
  BasalEnergyBurned: "basalEnergyBurned",
  Workout: "workout",
  HeartRateVariabilitySDNN: "heartRateVariabilitySDNN",
  Vo2Max: "vo2Max",
  StepCount: "stepCount",
  MindfulSession: "mindfulSession",
  SleepAnalysis: "sleepAnalysis",
  BodyMass: "bodyMass",
  LeanBodyMass: "leanBodyMass",
  BodyMassIndex: "bodyMassIndex",
  BodyTemperature: "bodyTemperature",
  BodyFatPercentage: "bodyFatPercentage",
  OxygenSaturation: "oxygenSaturation",
  RespiratoryRate: "respiratoryRate",
  BloodGlucose: "bloodGlucose",
  BloodPressure: "bloodPressure",
  Birthday: "dateOfBirth",
  BiologicalSex: "biologicalSex",
};

export const FitbitScopes = {
  Activity: "activity",
  Heartrate: "heartrate",
  Profile: "profile",
  Sleep: "sleep",
  Weight: "weight",
  CardioFitness: "cardio_fitness",
  Temperature: "temperature",
  RespiratoryRate: "respiratory_rate",
  OxygenSaturation: "oxygen_saturation",
};

export const OuraScopes = {
  Daily: "daily",
  HeartRate: "heartrate",
  Personal: "personal",
  Session: "session",
  Workout: "workout",
};

export const InsightType = {
  ExertionOptimalAm: "exertion_optimal_am",
  ExertionOptimalPm: "exertion_optimal_pm",
  CalorieBurnOptimalAm: "calorie_burn_optimal_am",
  CalorieBurnOptimalPm: "calorie_burn_optimal_pm",
  DurationOptimalAm: "duration_optimal_am",
  DurationOptimalPm: "duration_optimal_pm",
  HrvDecreaseMedsev: "hrv_decrease_medsev",
  HrvDecreaseHisev: "hrv_decrease_hisev",
  RecordCaloriesBurned: "record_calories_burned",
  RecordExertionRate: "record_exertion_rate",
  RecordCaloriesBurnedAcrossAllWorkoutTypes: "record_calories_burned_across_all_workout_types",
  RecordExertionRateAcrossAllWorkoutTypes: "record_exertion_rate_across_all_workout_types",
  MostEfficientWorkoutType: "most_efficient_workout_type",
  LongestWorkoutType: "longest_workout_type",
  AvgWorkoutCaloriesBurned: "avg_workout_calories_burned",
  AvgWorkoutExertionRate: "avg_workout_exertion_rate",
  UsualWorkoutTime: "usual_workout_time",
  OptimalWorkoutRoutine: "optimal_workout_routine",
  DurationTip: "duration_tip",
  WorkoutHrZone5HighMinutes: "workout_hr_zone5_high_minutes",
  WeekHrZonesLowMinutesBurnFat: "week_hr_zones_low_minutes_burn_fat",
  WeekHrZonesLowMinutesBurnCarb: "week_hr_zones_low_minutes_burn_carb",
  WeekHrZonesHighMinutesBurnCarb: "week_hr_zones_high_minutes_burn_carb",
  WeekHrZone5HighMinutes: "week_hr_zone5_high_minutes",
  AvgWorkoutDuration: "avg_workout_duration",
  WorkoutIntensityTooHigh: "workout_intensity_too_high",
  DayIntensityTooHigh: "day_intensity_too_high",
  FirstWorkoutInAWhileIntensityTooHigh: "first_workout_in_a_while_intensity_too_high",
  ActivityLevel: "activity_level",
};

export const Goal = {
  WeightLoss: "weightLoss",
  AthleticPerformance: "athleticPerformance",
};

export const SpecificGoal = {
  BuildLeanMuscle: "buildLeanMuscle",
  LoseWeight: "loseWeight",
  PrepareForEvent: "prepareForEvent",
  AccomplishMore: "accomplishMore",
  MaintainHealth: "maintainHealth",
};

export const HealthMetricType = {
  RestingHR: "RestingHR",
  OneMinuteHRR: "OneMinuteHRR",
  ThreeMinuteHRR: "ThreeMinuteHRR",
  HRV: "HRV",
  Vo2Max: "Vo2Max",
  ActiveCalories: "ActiveCalories",
  BasalCalories: "BasalCalories",
  TotalCalories: "TotalCalories",
  WorkoutCalories: "WorkoutCalories",
  WorkoutDistance: "WorkoutDistance",
  WorkoutDuration: "WorkoutDuration",
  ExertionRate: "ExertionRate",
  MovementLevel: "MovementLevel",
  MinsHRZone1: "MinsHRZone1",
  MinsHRZone2: "MinsHRZone2",
  MinsHRZone3: "MinsHRZone3",
  MinsHRZone4: "MinsHRZone4",
  MinsHRZone12: "MinsHRZone12",
  MinsHRZone23: "MinsHRZone23",
  MinsHRZone34: "MinsHRZone34",
  MinsHRZone45: "MinsHRZone45",
  MinsHRZone5: "MinsHRZone5",
  WorkoutMinsHRZone1: "WorkoutMinsHRZone1",
  WorkoutMinsHRZone2: "WorkoutMinsHRZone2",
  WorkoutMinsHRZone3: "WorkoutMinsHRZone3",
  WorkoutMinsHRZone4: "WorkoutMinsHRZone4",
  WorkoutMinsHRZone12: "WorkoutMinsHRZone12",
  WorkoutMinsHRZone23: "WorkoutMinsHRZone23",
  WorkoutMinsHRZone34: "WorkoutMinsHRZone34",
  WorkoutMinsHRZone45: "WorkoutMinsHRZone45",
  WorkoutMinsHRZone5: "WorkoutMinsHRZone5",
  MindfulMinutes: "MindfulMinutes",
  AvgWorkoutHR: "AvgWorkoutHR",
  MinWorkoutHR: "MinWorkoutHR",
  MaxWorkoutHR: "MaxWorkoutHR",
  SleepDuration: "SleepDuration",
  SleepDurationInbed: "SleepDurationInbed",
  SleepDurationAsleep: "SleepDurationAsleep",
  TotalWorkoutDuration: "TotalWorkoutDuration",
  TotalMinsHRZone12: "TotalMinsHRZone12",
  TotalMinsHRZone34: "TotalMinsHRZone34",
  WeeklyAvgWorkoutHR: "WeeklyAvgWorkoutHR",
  WeeklyExertionRate: "WeeklyExertionRate",
  DailyWorkoutDuration: "DailyWorkoutDuration",
  Weight: "Weight",
  SleepEfficiency: "SleepEfficiency",
  SleepLatency: "SleepLatency",
  SleepStageDeep: "SleepStageDeep",
  SleepStageLight: "SleepStageLight",
  SleepStageREM: "SleepStageREM",
  SleepStageWake: "SleepStageWake",
  SleepRestlessness: "SleepRestlessness",
  MaxHR: "MaxHR",
};

PointSdkRn.allQueryTypes = Object.values(QueryType);
PointSdkRn.allFitbitScopes = Object.values(FitbitScopes);

export default PointSdkRn;
