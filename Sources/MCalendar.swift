//
//  MCalendar.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

class MCalendar {
    let firstWeekday: Int
    private let calendar: Calendar

    init(firstWeekday: Int, locale: Locale) {
        self.firstWeekday = firstWeekday
        self.calendar = .init(firstWeekday: firstWeekday, locale: locale)
    }
}

// MARK: - Weekday Symbols
extension MCalendar {
    func getWeekdaySymbols() -> [String] { sortSymbolsArray(calendar.weekdaySymbols) }
    func getShortWeekdaySymbols() -> [String] { sortSymbolsArray(calendar.shortWeekdaySymbols) }
    func getVeryShortWeekdaySymbols() -> [String] { sortSymbolsArray(calendar.veryShortWeekdaySymbols) }
}
private extension MCalendar {
    func sortSymbolsArray(_ symbols: [String]) -> [String] {
        let symbols = Array(symbols[firstWeekday - 1..<symbols.count]) + symbols[0..<firstWeekday - 1]
        return symbols.map(\.capitalized)
    }
}
