//
//  MCalendar.swift of CalendarView
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

public class MCalendar {
    let firstWeekday: MWeekday
    private let locale: Locale
    
    public init(firstWeekday: MWeekday = .monday, locale: Locale = .autoupdatingCurrent) {
        self.firstWeekday = firstWeekday
        self.locale = locale
    }
}

extension MCalendar {
    func getWeekdaySymbol(_ day: MWeekday, format: WeekdaySymbolFormat) -> String { formatter.getString(for: day, format: format) }
    func getWeekdaySymbols(format: WeekdaySymbolFormat) -> [String] { weekDays.map { getWeekdaySymbol($0, format: format) }}
}

extension MCalendar {
    var maxNumberOfDays: Int { Calendar(identifier: .gregorian).weekdaySymbols.count }
}

private extension MCalendar {
    var formatter: MDateFormatter { .init(locale) }
    var weekDays: [MWeekday] { MWeekday.allCases(self) }
}
