//
//  MDate.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

class MDate {
    private let dateToCompare: Date
    private let calendar: Calendar
    private let firstWeekday: MWeekday

    init(date: Date, _ calendar: Calendar, _ firstWeekday: MWeekday) { self.dateToCompare = date; self.calendar = calendar; self.firstWeekday = firstWeekday }
}

// MARK: - Comparing Dates
extension MDate {
    func isLater(_ component: Calendar.Component, than date: Date?) -> Bool { getDateComparisonResult(component, date) == .orderedDescending }
    func isBefore(_ component: Calendar.Component, than date: Date) -> Bool { getDateComparisonResult(component, date) == .orderedAscending }
    func isSame(_ component: Calendar.Component, as date: Date?) -> Bool { getDateComparisonResult(component, date) == .orderedSame }
}
private extension MDate {
    func getDateComparisonResult(_ component: Calendar.Component, _ date: Date?) -> ComparisonResult { calendar.compare(dateToCompare, to: date ?? .distantPast, toGranularity: component) }
}

// MARK: - Calculating Difference Between Dates
extension MDate {
    func distance(to date: Date, in components: Set<Calendar.Component>) -> DateComponents { calendar.dateComponents(components, from: dateToCompare, to: date) }
}

// MARK: - Adding Dates
extension MDate {
    func adding(_ value: Int, _ component: Calendar.Component) -> Date { calendar.date(byAdding: component, value: value, to: dateToCompare) ?? dateToCompare }
}

// MARK: - Others
extension MDate {
    func getWeekday() -> MWeekday { .init(rawValue: calendar.component(.weekday, from: dateToCompare)) ?? .monday }
    func startOfMonth() -> Date { calendar.dateInterval(of: .month, for: dateToCompare)?.start ?? .distantPast }
    func endOfMonth() -> Date { calendar.dateInterval(of: .month, for: dateToCompare)?.end.addingTimeInterval(-1) ?? .distantPast }
}
