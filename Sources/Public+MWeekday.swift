//
//  Public+MWeekday.swift of CalendarView
//
//  Created by Alina Petrovska on 25.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

public enum MWeekday: Int { case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday }

extension MWeekday {
    static var allCases: [MWeekday] {
        let firstDayIndex = MCalendar.firstWeekday.rawValue
        let weekDaysIndexes = [Int](firstDayIndex ... 7) + [Int](1 ..< firstDayIndex)
        
        return .init(weekDaysIndexes)
    }
}

extension MWeekday {
    static var weekdaysCount: Int { 7 }
}

// MARK: - Helpers
fileprivate extension [MWeekday] {
    init(_ indexes: [Int]) { self = indexes.compactMap { .init(rawValue: $0) }}
}
