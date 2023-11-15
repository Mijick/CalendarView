//
//  Public+WeekdaysView.swift of CalendarView
//
//  Created by Alina Petrovska on 14.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

public protocol WeekdaysView: MView {
    associatedtype DayLabel: WeekDayLabel
    var calendar: MCalendar { get }
    
    func createWeekdayLabel(_ weekday: MWeekday) -> DayLabel
}

// MARK: - Customising View
public extension WeekdaysView {
    func createContent() -> AnyView { createDefaultContent().erased() }
    func createWeekdaysView() -> AnyView { createDefaultWeekdaysView().erased() }
    func createWeekdayLabel(_ weekday: MWeekday) -> DayLabel { createDefaultWeekDayLabel(weekday) as! DayLabel }
}
private extension WeekdaysView {
    func createDefaultContent() -> some View { createWeekdaysView() }
    func createDefaultWeekdaysView() -> some View { HStack { ForEach(weekDays, id: \.self, content: createWeekdayItem) }}
    func createDefaultWeekDayLabel(_ weekday: MWeekday) -> DefaultWeekdayLabel { DefaultWeekdayLabel(calendar: calendar, weekday: weekday) }
}
private extension WeekdaysView {
    func createWeekdayItem(_ weekday: MWeekday) -> some View { createWeekdayLabel(weekday).frame(maxWidth: .infinity, maxHeight: .infinity) }
}

// MARK: Helpers
public extension WeekdaysView {
    var weekDays: [MWeekday] { MWeekday.allCases(calendar) }
}
