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
    static func generate(startMonth: Date?, endMonth: Date?) -> Self {
        let startDate = MCalendar.mDate(startMonth ?? .now).startOfMonth()
        return createDatesRange(startDate, endMonth)
            .map { createMonthDate($0, startDate) }
            .map { createMonthViewData($0) }
    }
}
private extension [Data.MonthView] {
    static func createDatesRange(_ startDate: Date, _ endDate: Date?) -> ClosedRange<Int> { let endDate = MCalendar.mDate(endDate ?? .distantFuture).endOfMonth()
        guard startDate <= endDate else { fatalError("Start date must be lower than end date") }

        let numberOfMonthsBetweenDates = MCalendar.mDate(startDate).distance(to: endDate, in: [.month]).month ?? 0
        return 0...Swift.min(numberOfMonthsBetweenDates, 12 * 10)
    }
    static func createMonthDate(_ index: Int, _ startDate: Date) -> Date { MCalendar.mDate(startDate).adding(index, .month) }
    static func createMonthViewData(_ monthStart: Date) -> Data.MonthView { .generate(monthStart) }
}

// MARK: - Generating Single Month
private extension Data.MonthView {
    static func generate(_ month: Date) -> Self {
        let month = MCalendar.mDate(month).startOfMonth()
        let rawDates = createRawDates(month)
        let groupedDates = groupDates(rawDates)

        return .init(month: month, items: groupedDates)
    }
}
private extension Data.MonthView {
    static func createRawDates(_ month: Date) -> [Date] {
        let monthStartWeekday = MCalendar.mDate(month).getWeekday()

        let items = createRawDateItems(month, monthStartWeekday)
        return items
    }
    static func groupDates(_ rawDates: [Date]) -> [[Date]] {
        rawDates
            .enumerated()
            .reduce(into: [], reduceRawDates)
    }
}
private extension Data.MonthView {
    static func createRawDateItems(_ monthStartDate: Date, _ monthStartWeekday: MWeekday) -> [Date] {
        var items: [Date] = []

        for index in 0..<100 {
            let date = createRawDate(index, monthStartDate, monthStartWeekday)

            switch shouldStopPopulatingRawDateItems(items, date, monthStartDate) {
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
    static func createRawDate(_ index: Int, _ monthStartDate: Date, _ monthStartWeekday: MWeekday) -> Date {
        let shiftIndex = {
            let index = monthStartWeekday.rawValue - MCalendar.firstWeekday.rawValue
            return index < 0 ? index + weekdaysNumber : index
        }()
        return MCalendar.mDate(monthStartDate).adding(index - shiftIndex, .day)
    }
    static func shouldStopPopulatingRawDateItems(_ items: [Date], _ date: Date, _ monthStartDate: Date) -> Bool {
        guard items.count % weekdaysNumber == 0 else { return false }
        return MCalendar.mDate(date).isLater(.month, than: monthStartDate)
    }
}
private extension Data.MonthView {
    static var weekdaysNumber: Int { MWeekday.weekdaysCount }
}
