//
//  MDateRange.swift of CalendarView
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

public struct MDateRange {
    private var lowerDate: Date?
    private var upperDate: Date?

    public init() {}
}

// MARK: - Updating Range
public extension MDateRange {
    mutating func addToRange(_ date: Date) {
        if lowerDate == nil { setLowerDate(date.getDateWithoutTime()) }
        else if upperDate == nil { setUpperDate(date.getDateWithoutTime()) }
        else { updateExistedRange(date.getDateWithoutTime()) }
    }
}
private extension MDateRange {
    mutating func setLowerDate(_ date: Date) {
        if let upperDate, date <= upperDate { lowerDate = date }
        else if upperDate == nil { lowerDate = date }
    }
    mutating func setUpperDate(_ date: Date) {
        if let lowerDate, date >= lowerDate { upperDate = date }
        else if let lowerDate { upperDate = lowerDate; self.lowerDate = date }
    }
    mutating func updateExistedRange(_ date: Date) {
        lowerDate = date
        upperDate = nil
    }
}

// MARK: - Getting Range
extension MDateRange {
    func getRange() -> ClosedRange<Date>? { (lowerDate...upperDate) }
}

// MARK: - Others
extension MDateRange {
    func contains(_ date: Date) -> Bool { getRange()?.contains(date) == true }
    func isRangeCompleted() -> Bool { upperDate != nil }
}


// MARK: - Helpers
fileprivate extension Date {
    func getDateWithoutTime() -> Date {
        let calendar = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return Calendar.current.date(from: calendar) ?? self
    }
}
fileprivate func ...(_ lhs: Date?, _ rhs: Date?) -> ClosedRange<Date>? {
    if let lhs { return .init(uncheckedBounds: (lhs, rhs ?? lhs)) }
    return nil
}
