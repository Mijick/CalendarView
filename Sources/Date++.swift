//
//  Date++.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

// MARK: - Comparing
extension Date {
    func isLater(_ component: Calendar.Component, than date: Date?) -> Bool { getDateComparisonResult(component, date) == .orderedDescending }
    func isBefore(_ component: Calendar.Component, than date: Date?) -> Bool { getDateComparisonResult(component, date) == .orderedAscending }
    func isSame(_ component: Calendar.Component, as date: Date?) -> Bool { getDateComparisonResult(component, date) == .orderedSame }
}
private extension Date {
    func getDateComparisonResult(_ component: Calendar.Component, _ date: Date?) -> ComparisonResult { MCalendar.get().compare(self, to: date ?? .distantPast, toGranularity: component) }
}

// MARK: - Calculating Difference
extension Date {
    func distance(to date: Date, in component: Calendar.Component) -> Int { MCalendar.get().dateComponents([component], from: self, to: date).value(for: component) ?? 0 }
}

// MARK: - Adding
extension Date {
    func adding(_ value: Int, _ component: Calendar.Component) -> Date { MCalendar.get().date(byAdding: component, value: value, to: self) ?? self }
}

// MARK: - Start & End
extension Date {
    func start(of component: Calendar.Component) -> Date { MCalendar.get().dateInterval(of: component, for: self)?.start ?? .distantPast }
    func end(of component: Calendar.Component) -> Date { MCalendar.get().dateInterval(of: component, for: self)?.end.addingTimeInterval(-1) ?? .distantPast }
}

// MARK: - Getting Weekday
extension Date {
    func getWeekday() -> MWeekday { .init(rawValue: MCalendar.get().component(.weekday, from: self)) ?? .monday }
}


// MARK: - Helpers
extension Date {
    static var now: Date { .init() }
}
