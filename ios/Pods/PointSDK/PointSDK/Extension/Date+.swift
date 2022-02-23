import Foundation

extension Date {
    private static let dateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.timeZone = .autoupdatingCurrent
        formatter.formatOptions = .init(
            [
                .withFullTime,
                .withFullDate,
                .withDashSeparatorInDate,
                .withColonSeparatorInTime,
                .withFractionalSeconds,
                .withTimeZone,
            ]
        )
        .subtracting(.withColonSeparatorInTimeZone)
        return formatter
    }()

    var iso8601String: String {
        if #available(iOS 15.0, *) {
            return formatted(
                ISO8601FormatStyle(
                    dateSeparator: .dash,
                    dateTimeSeparator: .standard,
                    timeSeparator: .colon,
                    timeZoneSeparator: .omitted,
                    includingFractionalSeconds: true,
                    timeZone: .current
                )
            )
        } else {
            return Self.dateFormatter.string(from: self)
        }
    }
}
