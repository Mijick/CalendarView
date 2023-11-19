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

    init(_ lowerDate: Date?, _ upperDate: Date?) { self.lowerDate = lowerDate; self.upperDate = upperDate }
}

// MARK: - Updating Range
extension MDateRange {
    mutating func _addToRange(_ date: Date) {
        if lowerDate == nil { setLowerDate(date) }
        else if upperDate == nil { setUpperDate(date) }
        else { updateExistedRange(date) }
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
    func _getRange() -> ClosedRange<Date>? {
        if let lowerDate { return .init(uncheckedBounds: (lowerDate, upperDate ?? lowerDate)) }
        return nil
    }
}

// MARK: - Others
extension MDateRange {
    func contains(_ date: Date) -> Bool { getRange()?.contains(date) == true }
    func isRangeCompleted() -> Bool { upperDate != nil }
}
