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
    let calendar: MCalendar


    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(data.items, id: \.last, content: createSingleRow)
        }
        .frame(maxWidth: .infinity)
        .animation(animation, value: selectedDate)
        .animation(animation, value: selectedRange?.getRange())
    }
}
private extension MonthView {
    func createSingleRow(_ dates: [Date]) -> some View {
        HStack(spacing: 0) {
            ForEach(dates, id: \.self, content: createDayView)
        }
    }
}
private extension MonthView {
    func createDayView(_ date: Date) -> some View { DefaultDaySelectionView(
        date: date,
        isCurrentMonth: isCurrentMonth(date),
        selectedDate: $selectedDate,
        selectedRange: $selectedRange,
        calendar: calendar
    )}
}
private extension MonthView {
    func isCurrentMonth(_ date: Date) -> Bool { calendar.mDate(data.month).isSame(.month, as: date) }
}

// MARK: - Others
private extension MonthView {
    var animation: Animation { .bouncy }
}


// MARK: - Preview
#Preview {
    struct Preview: View {
        @State private var selectedDate: Date? = nil
        @State private var selectedRange: MDateRange? = .init()
        private let data: [Data.MonthView] = .generate(startMonth: .now, endMonth: .now, calendar: .init())


        var body: some View { MonthView(
            selectedDate: $selectedDate,
            selectedRange: $selectedRange,
            data: data.first!,
            calendar: .init()
        )}
    }

    return Preview().padding(.horizontal, 32)
}
