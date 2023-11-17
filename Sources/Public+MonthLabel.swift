//
//  Public+MonthLabel.swift of MijickCalendarView
//
//  Created by Alina Petrovska on 14.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

public protocol MonthLabel: View {
    var month: Date { get }
    var calendar: MCalendar { get }

    func createContent() -> AnyView
}

// MARK: - Customizing View
public extension MonthLabel {
    func createContent() -> AnyView { createDefaultContent().erased() }
    var body: some View { createContent() }
}
private extension MonthLabel {
    func createDefaultContent() -> some View {
        Text(monthText)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.black)
    }
}
private extension MonthLabel {
    var monthText: String { getString(format: "MMMM y") }
}

// MARK: - Helpers
public extension MonthLabel {
    func getString(format: String) -> String { calendar.formatter().getString(from: month, format: format) }
}
