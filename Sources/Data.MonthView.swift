//
//  Data.MonthView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

extension Data { struct MonthView {
    let month: Date
    let items: [[Date]]
}}

// MARK: - Generating Array
extension [Data.MonthView] {
    static func generate(startMonth: Date?, endMonth: Date?, calendar: MCalendar) -> Self {
        let startDate = calendar.mDate(startMonth ?? .now).startOfMonth()
        return createDatesRange(startDate, endMonth, calendar)
            .map { createMonthDate($0, startDate, calendar) }
            .map { createMonthViewData($0, calendar) }
    }
}
private extension [Data.MonthView] {
    static func createDatesRange(_ startDate: Date, _ endDate: Date?, _ calendar: MCalendar) -> ClosedRange<Int> { let endDate = calendar.mDate(endDate ?? .distantFuture).endOfMonth()
        guard startDate <= endDate else { fatalError("Start date must be lower than end date") }

        let numberOfMonthsBetweenDates = calendar.mDate(startDate).distance(to: endDate, in: [.month]).month ?? 0
        return 0...Swift.min(numberOfMonthsBetweenDates, 12 * 10)
    }
    static func createMonthDate(_ index: Int, _ startDate: Date, _ calendar: MCalendar) -> Date { calendar.mDate(startDate).adding(index, .month) }
    static func createMonthViewData(_ monthStart: Date, _ calendar: MCalendar) -> Data.MonthView { .generate(monthStart, calendar) }
}

// MARK: - Generating Single Month
private extension Data.MonthView {
    static func generate(_ month: Date, _ calendar: MCalendar) -> Self {
        let month = calendar.mDate(month).startOfMonth()
        let rawDates = createRawDates(month, calendar)
        let groupedDates = groupDates(rawDates)

        return .init(month: month, items: groupedDates)
    }
}
private extension Data.MonthView {
    static func createRawDates(_ month: Date, _ calendar: MCalendar) -> [Date] {
        let monthStartWeekday = calendar.mDate(month).getWeekday()

        let items = createRawDateItems(month, monthStartWeekday, calendar)
        return items
    }
    static func groupDates(_ rawDates: [Date]) -> [[Date]] {
        rawDates
            .enumerated()
            .reduce(into: [], reduceRawDates)
    }
}
private extension Data.MonthView {
    static func createRawDateItems(_ monthStartDate: Date, _ monthStartWeekday: MWeekday, _ calendar: MCalendar) -> [Date] {
        var items: [Date] = []

        for index in 0..<100 {
            let date = createRawDate(index, monthStartDate, monthStartWeekday, calendar)

            switch shouldStopPopulatingRawDateItems(items, date, monthStartDate, calendar) {
                case true: return items
                case false: items.append(date)
            }
        }

        return items
    }
    static func reduceRawDates(_ array: inout [[Date]], item: EnumeratedSequence<[Date]>.Iterator.Element) {
        switch item.offset % weekdaysNumber == 0 {
            case true: array.append([item.element])
            case false: array[array.count - 1].append(item.element)
        }
    }
}
private extension Data.MonthView {
    static func createRawDate(_ index: Int, _ monthStartDate: Date, _ monthStartWeekday: MWeekday, _ calendar: MCalendar) -> Date {
        let shiftIndex = {
            let index = monthStartWeekday.rawValue - calendar.firstWeekday.rawValue
            return index < 0 ? index + weekdaysNumber : index
        }()
        return calendar.mDate(monthStartDate).adding(index - shiftIndex, .day)
    }
    static func shouldStopPopulatingRawDateItems(_ items: [Date], _ date: Date, _ monthStartDate: Date, _ calendar: MCalendar) -> Bool {
        guard items.count % weekdaysNumber == 0 else { return false }
        return calendar.mDate(date).isLater(.month, than: monthStartDate)
    }
}
private extension Data.MonthView {
    static var weekdaysNumber: Int { MWeekday.weekdaysCount }
}
