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
    // MARK: Required Attributes
    var weekday: MWeekday { get }

    // MARK: View Customisation
    @MainActor func createContent() -> AnyView
}

// MARK: - Default View Implementation
public extension WeekdayLabel {
    @MainActor func createContent() -> AnyView { createDefaultContent().erased() }
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
    /// Returns a string of the selected format for the weekday.
    func getString(with format: WeekdaySymbolFormat) -> String { MDateFormatter.getString(for: weekday, format: format) }

    /// Returns a type-erased object.
    func erased() -> AnyWeekdayLabel { .init(self) }
}

// MARK: - Others
public extension WeekdayLabel {
    @MainActor var body: some View { createContent() }
}
