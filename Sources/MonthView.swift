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
    let calendar: MCalendar
    @State private var items: [[Date]] = []


    var body: some View {
        VStack(spacing: 0) {
            ForEach(items, id: \.self, content: createSingleRow)
        }
        .frame(maxWidth: .infinity)
        .animation(animation, value: selectedDate)
        .animation(animation, value: selectedRange?.getRange())
        .onAppear(perform: populateItems)
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
    func createDayView(_ date: Date) -> some View { DefaultDayView(
        date: date,
        selectedDate: $selectedDate,
        selectedRange: $selectedRange,
        calendar: calendar
    )}
}

// MARK: - Populating Items
private extension MonthView {
    func populateItems() {
        let rawDates = createRawDates()
        items = groupDates(rawDates)
    }
}
private extension MonthView {
    func createRawDates() -> [Date] {
        let monthStartDate = calendar.mDate(.now).startOfMonth()
        let monthStartWeekday = calendar.mDate(monthStartDate).getWeekday()

        let items = (0..<numberOfRows * weekdaysNumber).map { createRawDate(monthStartDate, monthStartWeekday, $0) }
        return items
    }
    func groupDates(_ rawDates: [Date]) -> [[Date]] {
        rawDates
            .enumerated()
            .reduce(into: [], reduceRawDates)
    }
}
private extension MonthView {
    func createRawDate(_ monthStartDate: Date, _ monthStartWeekday: MWeekday, _ index: Int) -> Date {
        let shiftIndex = {
            let index = monthStartWeekday.rawValue - calendar.firstWeekday.rawValue
            return index < 0 ? index + weekdaysNumber : index
        }()
        return calendar.mDate(monthStartDate).adding(index - shiftIndex, .day)
    }
    func reduceRawDates(_ array: inout [[Date]], item: EnumeratedSequence<[Date]>.Iterator.Element) {
        switch item.offset % weekdaysNumber == 0 {
            case true: array.append([item.element])
            case false: array[array.count - 1].append(item.element)
        }
    }
}
private extension MonthView {
    var numberOfRows: Int { 5 }
    var weekdaysNumber: Int { MWeekday.weekdaysCount }
}

// MARK: - Others
private extension MonthView {
    var animation: Animation { .bouncy }
}


// MARK: - Preview
#Preview {
    struct Preview: View {
        @State private var selectedDate: Date? = nil
        @State private var selectedRange: MDateRange? = nil
        private let calendar: MCalendar = .init(firstWeekday: .monday)


        var body: some View { MonthView(
            selectedDate: $selectedDate,
            selectedRange: $selectedRange,
            calendar: calendar
        )}
    }

    return Preview().padding(.horizontal, 32)
}
