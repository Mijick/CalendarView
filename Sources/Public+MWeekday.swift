//
//  Public+MWeekday.swift of MijickCalendarView
//
//  Created by Alina Petrovska on 25.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

public enum MWeekday: Int { case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday }

extension MWeekday {
    static func allCases(_ calendar: MCalendar) -> [MWeekday] {
        let firstDayIndex = calendar.firstWeekday.rawValue
        let numberOfDaysInWeek = calendar.maxNumberOfDays
        let weekDaysIndexes = [Int](firstDayIndex ... numberOfDaysInWeek) + [Int](1 ..< firstDayIndex)
        
        return .init(weekDaysIndexes)
    }
}

// MARK: Helpers
fileprivate extension [MWeekday] {
    init(_ indexes: [Int]) { self = indexes.compactMap { .init(rawValue: $0) }}
}
