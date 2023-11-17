//
//  DateHandler.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

class DateHandler {
    private let dateToCompare: Date

    init(date: Date) { self.dateToCompare = date }
}

// MARK: - Comparing Dates
extension DateHandler {
    func isLater(_ component: Calendar.Component, than date: Date?) -> Bool { getDateComparisonResult(component, date) == .orderedDescending }
    func isBefore(_ component: Calendar.Component, than date: Date) -> Bool { getDateComparisonResult(component, date) == .orderedAscending }
    func isSame(_ component: Calendar.Component, as date: Date?) -> Bool { getDateComparisonResult(component, date) == .orderedSame }
}
private extension DateHandler {
    func getDateComparisonResult(_ component: Calendar.Component, _ date: Date?) -> ComparisonResult { MCalendar.get().compare(dateToCompare, to: date ?? .distantPast, toGranularity: component) }
}

// MARK: - Calculating Difference Between Dates
extension DateHandler {
    func distance(to date: Date, in components: Set<Calendar.Component>) -> DateComponents { MCalendar.get().dateComponents(components, from: dateToCompare, to: date) }
}

// MARK: - Adding Dates
extension DateHandler {
    func adding(_ value: Int, _ component: Calendar.Component) -> Date { MCalendar.get().date(byAdding: component, value: value, to: dateToCompare) ?? dateToCompare }
}

// MARK: - Others
extension DateHandler {
    func getWeekday() -> MWeekday { .init(rawValue: MCalendar.get().component(.weekday, from: dateToCompare)) ?? .monday }
    func startOfMonth() -> Date { MCalendar.get().dateInterval(of: .month, for: dateToCompare)?.start ?? .distantPast }
    func endOfMonth() -> Date { MCalendar.get().dateInterval(of: .month, for: dateToCompare)?.end.addingTimeInterval(-1) ?? .distantPast }
}
