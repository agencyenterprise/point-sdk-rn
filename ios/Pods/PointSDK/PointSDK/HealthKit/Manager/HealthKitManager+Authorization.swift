import Foundation
import HealthKit

public extension HealthKitManager {
    /// Requests `HealthKit` authorization if the user never granted or refused permissions to the requested data types.
    /// - Parameter readObjects: `HealthKit` data types to read.
    func requestAuthorizationIfPossible(toRead readObjects: Set<HKObjectType>) async throws {
        switch try await Self.healthStore.statusForAuthorizationRequest(toShare: [], read: readObjects) {
        case .shouldRequest: try await requestAuthorization(toRead: readObjects)
        case .unknown, .unnecessary: break
        @unknown default: try await requestAuthorization(toRead: readObjects)
        }
    }

    private func requestAuthorization(toRead readObjects: Set<HKObjectType>) async throws {
        if #available(iOS 15.0, *) {
            try await Self.healthStore.requestAuthorization(toShare: [], read: readObjects)
        } else {
            _ = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Bool, Swift.Error>) in
                Self.healthStore.requestAuthorization(toShare: nil, read: readObjects) {
                    switchAndContinue(continuation: continuation, value: $0, error: $1)
                }
            }
        }
    }
}
