//
//  MCalendar.swift of CalendarView
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

public struct MCalendar {
    static var firstWeekday: MWeekday = .monday
    static var locale: Locale = .autoupdatingCurrent
}

extension MCalendar {
    static func mDate(_ date: Date) -> MDate { .init(date: date, calendar, Self.firstWeekday) }
}

extension MCalendar {
    static func getWeekdaySymbol(_ day: MWeekday, format: WeekdaySymbolFormat) -> String { MDateFormatter.getString(for: day, format: format) }
    static func getWeekdaySymbols(format: WeekdaySymbolFormat) -> [String] { MWeekday.allCases.map { getWeekdaySymbol($0, format: format) }}
}

private extension MCalendar {
    static var calendar: Calendar { .init(identifier: .gregorian) }
}
