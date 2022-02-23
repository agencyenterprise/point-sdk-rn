import HealthKit

extension HKQuantityType {
    static func makeQuantityType(for identifier: HKQuantityTypeIdentifier) -> HKQuantityType {
        if #available(iOS 15.0, *) { return .init(identifier) }
        else { return .quantityType(forIdentifier: identifier)! }
    }
}
