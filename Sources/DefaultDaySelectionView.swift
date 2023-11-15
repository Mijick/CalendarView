//
//  DefaultDaySelectionView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct DefaultDaySelectionView: DayView {
    var date: Date
    var month: Date
    var selectedDate: Binding<Date?>?
    var selectedRange: Binding<MDateRange?>?
    var calendar: MCalendar
}


// MARK: - Preview
#Preview {
    struct Preview: View {
        @State private var selectedDate: Date? = nil
        @State private var selectedRange: Binding<MDateRange?>? = nil
        private let date: Date = .now
        private let calendar: MCalendar = .init()


        var body: some View { DefaultDaySelectionView(
            date: date,
            month: .now,
            selectedDate: $selectedDate,
            selectedRange: selectedRange,
            calendar: calendar
        )}
    }

    return Preview()
}