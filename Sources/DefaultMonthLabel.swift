//
//  DefaultMonthLabel.swift
//
//
//  Created by Alina Petrovska on 14.11.2023.
//

import SwiftUI

struct DefaultMonthLabel: MonthLabel {
    public var month: Date
    public let calendar: MCalendar
}

// MARK: - Preview
#Preview {
    struct Preview: View {
        private let date: Date = .init()
        private let calendar: MCalendar = .init()


        var body: some View { DefaultMonthLabel(
            month: date,
            calendar: calendar
        )}
    }

    return Preview()
}
