//
//  Public+DefaultWeekdayLabel.swift of CalendarView
//
//  Created by Alina Petrovska on 13.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

public struct DefaultWeekdayLabel: WeekDayLabel {
    public let calendar: MCalendar
    public let weekday: MWeekday
}

public extension DefaultWeekdayLabel {
     func createContent() -> some View {
         Text(getString(with: .veryShort))
             .foregroundColor(.gray)
             .font(.subheadline)
    }
}
