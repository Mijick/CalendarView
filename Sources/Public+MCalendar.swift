//
//  MCalendar.swift of MijickCalendarView
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

public class MCalendar {
    let firstWeekday: MWeekday
    let formatter: MDateFormatter
    private let locale: Locale

    public init(firstWeekday: MWeekday = .monday, locale: Locale = .autoupdatingCurrent) {
        self.firstWeekday = firstWeekday
        self.locale = locale
        self.formatter = .init(locale)
    }
}

extension MCalendar {
    func getWeekdaySymbol(_ day: MWeekday, format: WeekdaySymbolFormat) -> String { formatter.getString(for: day, format: format) }
    func getWeekdaySymbols(format: WeekdaySymbolFormat) -> [String] { weekDays.map { getWeekdaySymbol($0, format: format) }}
}

private extension MCalendar {
    var weekDays: [MWeekday] { MWeekday.allCases(self) }
}
