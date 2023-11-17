//
//  Public+WeekDayLabel.swift of CalendarView
//
//  Created by Alina Petrovska on 13.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

public protocol WeekDayLabel: View {
    var weekday: MWeekday { get }

    func createContent() -> AnyView
}

// MARK: - Customising View
public extension WeekDayLabel {
    func createContent() -> AnyView { createDefaultContent().erased() }
    var body: some View { createContent() }
}
private extension WeekDayLabel {
    func createDefaultContent() -> some View {
        Text(getString(with: .veryShort))
            .foregroundColor(.gray)
            .font(.system(size: 14))
    }
}

// MARK: - Helper Flags
public extension WeekDayLabel {
    func getString(with format: WeekdaySymbolFormat) -> String { MCalendar.getWeekdaySymbol(weekday, format: format) }
    func erased() -> AnyWeekDayLabel { .init(self) }
}
