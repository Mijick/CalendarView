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
    @Binding var selectedMonthIndex: Int
    let data: Data.MonthView
    let config: CalendarConfig


    var body: some View {
        LazyVStack(spacing: config.daysSpacing.vertical) {
            ForEach(data.items, id: \.last, content: createSingleRow)
        }
        .background {
            GeometryReader { proxy in
                let minX = proxy.frame(in: .global).minX
                Color.clear
                    .preference(key: MonthViewOffsetKey.self, value: minX)
                    .onPreferenceChange(MonthViewOffsetKey.self, perform: { value in
                        // we need to detect index change + stop of scrolling
                        if value == 0.0{
                            selectedMonthIndex+=1
                        }
//                        if value == 0.0 && (selectedMonthIndex == 0 || viewModel.selectedWeekIndex == 2) {
//                            viewModel.addNeededWeek()
//                            viewModel.updateSelectedDate()
//                        }
                    })
            }
        }

        .frame(maxWidth: .infinity)
        .animation(animation, value: selectedDate)
        .animation(animation, value: selectedRange?.getRange())
    }
}

private struct MonthViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
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
