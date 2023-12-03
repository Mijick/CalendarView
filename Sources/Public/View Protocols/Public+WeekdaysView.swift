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
    func createContent() -> AnyView
    func createWeekdayLabel(_ weekday: MWeekday) -> AnyWeekdayLabel
}

// MARK: - Customising View
public extension WeekdaysView {
    func createContent() -> AnyView { createWeekdaysView().erased() }
    func createWeekdaysView() -> AnyView { createDefaultWeekdaysView().erased() }
    func createWeekdayLabel(_ weekday: MWeekday) -> AnyWeekdayLabel { createDefaultWeekDayLabel(weekday).erased() }

    var body: some View { createContent() }
}
private extension WeekdaysView {
    func createDefaultWeekdaysView() -> some View { HStack(spacing: 0) { ForEach(MWeekday.allCases, id: \.self, content: createWeekdayItem) }}
    func createDefaultWeekDayLabel(_ weekday: MWeekday) -> DefaultWeekdayLabel { DefaultWeekdayLabel(weekday: weekday) }
}
private extension WeekdaysView {
    func createWeekdayItem(_ weekday: MWeekday) -> some View { createWeekdayLabel(weekday).frame(maxWidth: .infinity) }
}
