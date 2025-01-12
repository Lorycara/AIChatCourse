import Foundation

extension Date {
    func addingDateInterval(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let totalSeconds = (days * 24 * 3600) + (hours * 3600) + (minutes * 60)
        return self.addingTimeInterval(TimeInterval(totalSeconds))
    }
}
