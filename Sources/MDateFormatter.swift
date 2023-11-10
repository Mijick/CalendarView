//
//  MDateFormatter.swift
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import Foundation

class MDateFormatter {
    private let locale: Locale
    
    init(_ locale: Locale) { self.locale = locale}
}

extension MDateFormatter {
    func getString(from date: Date, format: String) -> String {
        let formatter = formatter
        formatter.dateFormat = format
        let formattedDate = formatter
            .string(from: date)
            .split(separator: " ")
            .map { String($0).firstUppercased() }
            .joined(separator: " ")
        
        return formattedDate
    }
    func getString(for day: MWeekday, format: WeekdaySymbolFormat) -> String {
        switch format {
            case .veryShort: return formatter.veryShortWeekdaySymbols[day.rawValue - 1].firstUppercased()
            case .short: return formatter.shortWeekdaySymbols[day.rawValue - 1].firstUppercased()
            case .full: return formatter.standaloneWeekdaySymbols[day.rawValue - 1].firstUppercased()
        }
    }
}

private extension MDateFormatter {
    var formatter: DateFormatter {
        let dayFormatter = DateFormatter()
        dayFormatter.locale = locale
        return dayFormatter
    }
}
