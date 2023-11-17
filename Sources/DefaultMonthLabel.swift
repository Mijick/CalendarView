//
//  DefaultMonthLabel.swift
//
//
//  Created by Alina Petrovska on 14.11.2023.
//

import SwiftUI

struct DefaultMonthLabel: MonthLabel {
    public var month: Date
}

// MARK: - Preview
#Preview {
    struct Preview: View {
        private let date: Date = .init()

        var body: some View { DefaultMonthLabel(month: date) }
    }

    return Preview()
}
