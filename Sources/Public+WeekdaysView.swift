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
    var calendar: MCalendar { get }
}

// MARK: - Customising View
public extension WeekdaysView {
    func createContent() -> AnyView { createDefaultContent().erased() }
    func createWeekdaysView() -> AnyView { createDefaultWeekdaysView().erased() }
    func createWeekdayLabel(_ day: MWeekday) -> AnyView { createDefaultWeekDayLabel(day).erased() }
}
private extension WeekdaysView {
    func createDefaultContent() -> some View { createWeekdaysView() }
    func createDefaultWeekdaysView() -> some View { HStack { ForEach(weekDays, id: \.self, content: createWeekdayLabel) }}
    func createDefaultWeekDayLabel(_ day: MWeekday) -> some View { DefaultWeekdayLabel(calendar: calendar, weekday: day).frame(maxWidth: .infinity, maxHeight: .infinity) }
}

// MARK: Helpers
public extension WeekdaysView {
    var weekDays: [MWeekday] { MWeekday.allCases(calendar) }
}
