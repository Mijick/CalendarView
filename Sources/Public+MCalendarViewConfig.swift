//
//  Public+MCalendarViewConfig.swift of
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

// MARK: - Range
extension MCalendarView.Config {
    public func startMonth(_ value: Date?) -> Self { changing(path: \.startMonth, to: value) }
    public func endMonth(_ value: Date?) -> Self { changing(path: \.endMonth, to: value) }
}

// MARK: - Calendar
extension MCalendarView.Config {
    public func firstWeekday(_ value: MWeekday) -> Self { MCalendar.firstWeekday = value; return self }
    public func locale(_ value: Locale) -> Self { MCalendar.locale = value; return self }
}

// MARK: - Modifiers
extension MCalendarView.Config {
    public func scrollTo(date: Date?) -> Self { changing(path: \.scrollDate, to: date) }
    public func onMonthChange(_ value: @escaping (Date) -> ()) -> Self { changing(path: \.onMonthChange, to: value) }
}

// MARK: - Views
extension MCalendarView.Config {
    public func createCustomMonthLabel(_ builder: @escaping (Date) -> some MonthLabel) -> Self { changing(path: \.monthLabel, to: builder) }
    public func createCustomWeekdaysView(_ builder: @escaping (MCalendar) -> some WeekdaysView) -> Self { changing(path: \.weekdaysView, to: builder) }
    public func createCustomDayView(_ builder: @escaping (Date, Bool, Binding<Date?>?, Binding<MDateRange?>?, MCalendar) -> some DayView) -> Self { changing(path: \.dayView, to: builder) }
}


// MARK: - Internal
extension MCalendarView { public struct Config: Configurable { public init() {}
    private(set) var startMonth: Date? = nil
    private(set) var endMonth: Date? = nil
    
    private(set) var scrollDate: Date? = nil
    private(set) var onMonthChange: (Date) -> () = {_ in}
    
    private(set) var monthLabel: (Date) -> any MonthLabel = DefaultMonthLabel.init
    private(set) var weekdaysView: (MCalendar) -> any WeekdaysView = DefaultWeekdaysView.init
    private(set) var dayView: (Date, Bool, Binding<Date?>?, Binding<MDateRange?>?, MCalendar) -> any DayView = DefaultDaySelectionView.init

    private(set) var calendar: MCalendar = .init()
}}
