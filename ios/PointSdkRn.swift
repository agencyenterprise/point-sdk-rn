import Foundation
import PointSDK

@objc(PointSdkRn)
class PointSdkRn: NSObject {
  var healthKit: HealthKitManager?
  var healthService: HealthDataService? { Point.healthDataService }

  /**
   *  setup               Initialize PointSDK
   *  @param clientId     Client ID
   *  @param clientSecret Client Secret
   *  @param permissions  Permissions
   *  @param callback     Completion handler
   */
  @objc
  func setup(_ clientId: String, clientSecret: String, environment: String, verbose: Bool = false, callback: RCTResponseSenderBlock) -> Void {
    Point.verbose = verbose
    
    Point.setup(
      clientId: clientId,
      clientSecret: clientSecret,
      environment: environmentsMapping(type: environment)
    )
    
    callback([NSNull(), true])
  }
  
  /**
   *  login               Login to Point
   *  @param accessToken  Access token
   *  @param resolve      Resolve handler
   *  @param reject       Reject handler
   */
  @objc
  func setUserToken(_ accessToken: String, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        try await Point.setUserToken(accessToken: accessToken)
        resolve(true)
      } catch {
        reject("login", error.localizedDescription, error)
      }
    }
  }

  @objc
  func setAccessToken(_ accessToken: String, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        try await Point.setAccessToken(accessToken: accessToken)
        resolve(true)
      } catch {
        reject("login", error.localizedDescription, error)
      }
    }
  }

  @objc
  func setRefreshToken(_ refreshToken: String, userId: String, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        try await Point.setRefreshToken(
          refreshToken: refreshToken,
           userId: userId.replacingOccurrences(of: "|", with: "%7C", options: .literal, range: nil)
        )
        resolve(true)
      } catch {
        reject("login", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  logout          Logout from Point
   *  @param resolve  Resolve handler
   *  @param reject   Reject handler
   */
  @objc
  func logout(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Task {
      do {
        try await Point.logout()
        resolve(true)
      } catch {
        reject("logout", error.localizedDescription, error)
      }
    }
  }
  
  /**
   *  constantsToExport	Expose constants to React Native
   */
  @objc
  func constantsToExport() -> [String: Any] {
    return [
      "queryTypes": HealthQueryType.allCases.map { $0.rawValue }
    ]
  }
}
