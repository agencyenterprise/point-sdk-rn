import Foundation
import HealthKit

extension NSSortDescriptor {
    static func healthEndDate(isAscending: Bool) -> NSSortDescriptor {
        .init(key: HKSampleSortIdentifierEndDate, ascending: isAscending)
    }
}

extension Array where Element == NSSortDescriptor {
    static func healthEndDate(isAscending: Bool) -> Self {
        [.healthEndDate(isAscending: isAscending)]
    }
}
