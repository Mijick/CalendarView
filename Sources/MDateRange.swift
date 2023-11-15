//
//  MDateRange.swift of CalendarView
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import Foundation

public class MDateRange {
    private var lowerDate: Date?
    private var upperDate: Date?
}

extension MDateRange {
    func getRange() -> ClosedRange<Date>? { (lowerDate...upperDate) }
    func contains(_ date: Date) -> Bool { getRange()?.contains(date) == true }
    func remove(_ date: Date) {
        guard upperDate != nil else { return }
        
        if upperDate == date {
            upperDate = nil
        } else if lowerDate == date {
            lowerDate = upperDate
            upperDate = nil
        }
    }
    func addToRange(_ date: Date) {
        if lowerDate == nil { setLowerDate(date.getDateWithoutTime()) }
        else if upperDate == nil { setUpperDate(date.getDateWithoutTime()) }
        else { addDateToExistedRange(date.getDateWithoutTime()) }
    }
}

private extension MDateRange {
    func addDateToExistedRange(_ date: Date) {
        if date < lowerDate ?? Date() { lowerDate = date }
        else if date > upperDate ?? Date() { upperDate = date }
    }
    func setLowerDate(_ date: Date) {
        if let upperDate, date <= upperDate { lowerDate = date }
        else if upperDate == nil { lowerDate = date }
    }
    func setUpperDate(_ date: Date) {
        if let lowerDate, date >= lowerDate { upperDate = date }
        else if let lowerDate { upperDate = lowerDate; self.lowerDate = date }
    }
}

// MARK: Helpers
fileprivate extension Date {
    static func ==(_ lhs: Date?, _ rhs: Date) -> Bool {
        guard let lhs else { return false }
        return lhs.getDateWithoutTime() == rhs.getDateWithoutTime()
    }
    func getDateWithoutTime() -> Date {
        let calendar = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return Calendar.current.date(from: calendar) ?? self
    }
}

fileprivate func ...(_ lhs: Date?, _ rhs: Date?) -> ClosedRange<Date>? {
    if let lhs, let rhs { return .init(uncheckedBounds: (lhs, rhs)) }
    return nil
}
