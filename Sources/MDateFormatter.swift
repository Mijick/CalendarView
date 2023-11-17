//
//  MDateFormatter.swift of CalendarView
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

class MDateFormatter {}
extension MDateFormatter {
    static func getString(from date: Date, format: String) -> String {
        getFormatter(format)
            .string(from: date)
            .capitalized
    }
    static func getString(for weekday: MWeekday, format: WeekdaySymbolFormat) -> String {
        switch format {
            case .veryShort: return getFormatter().veryShortWeekdaySymbols[weekday.rawValue - 1].capitalized
            case .short: return getFormatter().shortWeekdaySymbols[weekday.rawValue - 1].capitalized
            case .full: return getFormatter().standaloneWeekdaySymbols[weekday.rawValue - 1].capitalized
        }
    }
}

private extension MDateFormatter {
    static func getFormatter(_ format: String = "") -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = MCalendar.locale
        dateFormatter.dateFormat = format
        return dateFormatter
    }
}
