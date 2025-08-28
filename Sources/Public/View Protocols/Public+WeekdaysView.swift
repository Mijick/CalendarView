//
//  Public+WeekdaysView.swift of CalendarView
//
//  Created by Alina Petrovska on 14.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

public protocol WeekdaysView: View {
    // MARK: View Customisation
    @MainActor func createContent() -> AnyView
    @MainActor func createWeekdayLabel(_ weekday: MWeekday) -> AnyView
}

// MARK: - Default View Implementation
public extension WeekdaysView {
    @MainActor func createContent() -> AnyView { createWeekdaysView().erased() }
    @MainActor func createWeekdayLabel(_ weekday: MWeekday) -> AnyView { createDefaultWeekDayLabel(weekday).erased() }
}
private extension WeekdaysView {
    func createDefaultWeekDayLabel(_ weekday: MWeekday) -> DefaultWeekdayLabel { DefaultWeekdayLabel(weekday: weekday) }
}

// MARK: - Helpers
public extension WeekdaysView {
    /// Creates weekdays view using the selected weekday labels. Cannot be overriden.
    func createWeekdaysView() -> some View { HStack(spacing: 0) { ForEach(MWeekday.allCases, id: \.self, content: createWeekdayItem) } }
}
private extension WeekdaysView {
    @MainActor func createWeekdayItem(_ weekday: MWeekday) -> some View { createWeekdayLabel(weekday).frame(maxWidth: .infinity) }
}

// MARK: - Others
public extension WeekdaysView {
    @MainActor var body: some View { createContent() }
}
