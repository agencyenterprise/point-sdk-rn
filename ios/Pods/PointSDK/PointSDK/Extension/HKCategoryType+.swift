import HealthKit

extension HKCategoryType {
    static func makeCategoryType(for identifier: HKCategoryTypeIdentifier) -> HKCategoryType {
        if #available(iOS 15.0, *) { return .init(identifier) }
        else { return .categoryType(forIdentifier: identifier)! }
    }
}
