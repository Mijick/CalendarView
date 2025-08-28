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

    // MARK: View Customisation
    @MainActor func createContent() -> AnyView
}

// MARK: - Default View Implementation
public extension MonthLabel {
    @MainActor func createContent() -> AnyView { createDefaultContent().erased() }
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
    @MainActor var body: some View { createContent() }
}
