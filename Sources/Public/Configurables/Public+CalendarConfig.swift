//
//  Public+CalendarConfig.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

// MARK: - Calendar Configuration
public extension CalendarConfig {
    /// Sets the start date of the calendar.
    /// DEFAULT: Current month
    func startMonth(_ value: Date) -> Self { MCalendar.startDate = value.start(of: .month); return self }

    /// Sets the end date of the calendar.
    /// DEFAULT: A date  in 10 years
    func endMonth(_ value: Date) -> Self { MCalendar.endDate = value.end(of: .month); return self }

    /// Sets the first day of the week.
    /// DEFAULT:: Monday
    func firstWeekday(_ value: MWeekday) -> Self { MCalendar.firstWeekday = value; return self }

    /// Sets the locale of the calendar.
    /// DEFAULT: AutoupdatingCurrent
    func locale(_ value: Locale) -> Self { MCalendar.locale = value; return self }
}

// MARK: - Distances Between Objects
public extension CalendarConfig {
    /// Sets the top scroll padding in the view.
    func monthsTopPadding(_ value: CGFloat) -> Self { changing(path: \.monthsPadding.top, to: value) }

    /// Sets the bottom scroll padding in the view.
    func monthsBottomPadding(_ value: CGFloat) -> Self { changing(path: \.monthsPadding.bottom, to: value) }

    /// Sets the distance between the month label and the day cell in the view.
    func monthLabelToDaysDistance(_ value: CGFloat) -> Self { changing(path: \.monthLabelDaysSpacing, to: value) }

    /// Sets the spacing between months in the view.
    func monthsSpacing(_ value: CGFloat) -> Self { changing(path: \.monthsSpacing, to: value) }

    /// Sets the vertical spacing between day cells in the view.
    func daysVerticalSpacing(_ value: CGFloat) -> Self { changing(path: \.daysSpacing.vertical, to: value) }

    /// Sets the horizontal spacing between day cells in the view.
    func daysHorizontalSpacing(_ value: CGFloat) -> Self { changing(path: \.daysSpacing.horizontal, to: value) }
}

// MARK: - View Customisation
public extension CalendarConfig {
    /// Sets the background for the months view.
    func monthsViewBackground(_ value: Color) -> Self { changing(path: \.monthsViewBackground, to: value) }
}

// MARK: - Custom Views
public extension CalendarConfig {
    /// Replaces the default weekdays view with a selected implementation.
    func weekdaysView(_ builder: @escaping () -> some WeekdaysView) -> Self { changing(path: \.weekdaysView, to: builder) }

    /// Replaces the default month label with a selected implementation.
    func monthLabel(_ builder: @escaping (Date) -> some MonthLabel) -> Self { changing(path: \.monthLabel, to: builder) }

    /// Replaces the default day view with a selected implementation.
    func dayView(_ builder: @escaping (Date, Bool, Binding<Date?>?, Binding<MDateRange?>?) -> some DayView) -> Self { changing(path: \.dayView, to: builder) }
}

// MARK: - Modifiers
public extension CalendarConfig {
    /// Scrolls the calendar to the selected date.
    func scrollTo(date: Date?) -> Self { changing(path: \.scrollDate, to: date) }

    /// Triggers when a new month is about to be visible.
    func onMonthChange(_ value: @escaping (Date) -> ()) -> Self { changing(path: \.onMonthChange, to: value) }
}


// MARK: - Internal
public struct CalendarConfig: Configurable { public init() {}
    private(set) var monthLabelDaysSpacing: CGFloat = 12
    private(set) var monthsPadding: (top: CGFloat, bottom: CGFloat) = (12, 24)
    private(set) var monthsSpacing: CGFloat = 24
    private(set) var daysSpacing: (vertical: CGFloat, horizontal: CGFloat) = (2, 0)

    private(set) var monthsViewBackground: Color = .clear

    private(set) var weekdaysView: () -> any WeekdaysView = DefaultWeekdaysView.init
    private(set) var monthLabel: (Date) -> any MonthLabel = DefaultMonthLabel.init
    private(set) var dayView: (Date, Bool, Binding<Date?>?, Binding<MDateRange?>?) -> any DayView = DefaultDayView.init

    private(set) var scrollDate: Date? = nil
    private(set) var onMonthChange: (Date) -> () = {_ in}
}
