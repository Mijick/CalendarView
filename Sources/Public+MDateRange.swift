//
//  Public+MDateRange.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

public extension MDateRange {
    init(startDate: Date? = nil, endDate: Date? = nil) { self.init(startDate, endDate) }
}

// MARK: - Updating Range
public extension MDateRange {
    mutating func addToRange(_ date: Date) { _addToRange(date) }
}

// MARK: - Getting Range
public extension MDateRange {
    func getRange() -> ClosedRange<Date>? { _getRange() }
}
