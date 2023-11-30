//
//  Public+WeekdayLabel.swift of CalendarView
//
//  Created by Alina Petrovska on 13.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

public protocol WeekdayLabel: View {
    var weekday: MWeekday { get }

    func createContent() -> AnyView
}

// MARK: - Customising View
public extension WeekdayLabel {
    func createContent() -> AnyView { createDefaultContent().erased() }
    var body: some View { createContent() }
}
private extension WeekdayLabel {
    func createDefaultContent() -> some View {
        Text(getString(with: .veryShort))
            .foregroundColor(.onBackgroundSecondary)
            .font(.system(size: 14))
    }
}

// MARK: - Helpers
public extension WeekdayLabel {
    func erased() -> AnyWeekdayLabel { .init(self) }
}
public extension WeekdayLabel {
    func getString(with format: WeekdaySymbolFormat) -> String { MDateFormatter.getString(for: weekday, format: format) }
}
