import HealthKit
import Foundation

extension NSPredicate {
    static func dateRange(start: Date?, end: Date?) -> NSPredicate {
        HKQuery.predicateForSamples(withStart: start, end: end, options: .strictStartDate)
    }
}
