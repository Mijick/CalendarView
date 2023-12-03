//
//  Public+MonthLabel.swift of CalendarView
//
//  Created by Alina Petrovska on 14.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

public protocol MonthLabel: View {
    // MARK: Required Attributes
    var month: Date { get }

    /// Replaces the default body implementation.
    func createContent() -> AnyView
}

// MARK: - Default Implementation
public extension MonthLabel {
    func createContent() -> AnyView { createDefaultContent().erased() }
}
private extension MonthLabel {
    func createDefaultContent() -> some View {
        Text(getString(format: "MMMM y"))
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.onBackgroundPrimary)
    }
}

// MARK: - Helpers
public extension MonthLabel {
    /// Returns a string of the selected format for the month.
    func getString(format: String) -> String { MDateFormatter.getString(from: month, format: format) }
}

// MARK: - Others
public extension MonthLabel {
    var body: some View { createContent() }
}
