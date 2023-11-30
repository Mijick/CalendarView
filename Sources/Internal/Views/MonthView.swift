//
//  MonthView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct MonthView: View {
    @Binding var selectedDate: Date?
    @Binding var selectedRange: MDateRange?
    let data: Data.MonthView
    let config: CalendarConfig


    var body: some View {
        LazyVStack(spacing: config.daysSpacing.vertical) {
            ForEach(data.items, id: \.last, content: createSingleRow)
        }
        .frame(maxWidth: .infinity)
        .animation(animation, value: selectedDate)
        .animation(animation, value: selectedRange?.getRange())
    }
}
private extension MonthView {
    func createSingleRow(_ dates: [Date]) -> some View {
        HStack(spacing: config.daysSpacing.horizontal) {
            ForEach(dates, id: \.self, content: createDayView)
        }
    }
}
private extension MonthView {
    func createDayView(_ date: Date) -> some View {
        config.dayView(date, isCurrentMonth(date), $selectedDate, $selectedRange).erased()
    }
}
private extension MonthView {
    func isCurrentMonth(_ date: Date) -> Bool { data.month.isSame(.month, as: date) }
}

// MARK: - Others
private extension MonthView {
    var animation: Animation { .spring(response: 0.32, dampingFraction: 1, blendDuration: 0) }
}
