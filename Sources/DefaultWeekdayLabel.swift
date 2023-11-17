//
//  Public+DefaultWeekdayLabel.swift of CalendarView
//
//  Created by Alina Petrovska on 13.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

struct DefaultWeekdayLabel: WeekDayLabel {
    let weekday: MWeekday
}

// MARK: - Preview
#Preview {
    struct Preview: View {
        private var weekday: MWeekday = .monday

        var body: some View { DefaultWeekdayLabel(weekday: weekday) }
    }

    return Preview()
}
