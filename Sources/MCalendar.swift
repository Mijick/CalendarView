//
//  MCalendar.swift of CalendarView
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

struct MCalendar {
    static var firstWeekday: MWeekday = .monday
    static var locale: Locale = .autoupdatingCurrent

    private static var _calendar: Calendar = .init(identifier: .gregorian)
}

extension MCalendar {
    static func mDate(_ date: Date) -> DateHandler { .init(date) }


    static func get() -> Calendar { _calendar }
}
