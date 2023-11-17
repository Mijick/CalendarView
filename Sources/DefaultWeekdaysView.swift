//
//  DefaultWeekdaysView.swift of CalendarView
//
//  Created by Alina Petrovska on 14.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

struct DefaultWeekdaysView: WeekdaysView {
    let calendar: MCalendar
}

// MARK: - Preview
#Preview {
    struct Preview: View {
        private let calendar: MCalendar = .init()
        
        var body: some View { DefaultWeekdaysView(calendar: calendar) }
    }

    return Preview()
}
