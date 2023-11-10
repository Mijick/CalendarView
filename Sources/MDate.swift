//
//  MDate.swift
//
//  Created by Alina Petrovska on 26.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import Foundation

class MDate {
    var lowerDate: Date?
    var upperDate: Date?
}

extension MDate {
    func getDate() -> Date? { upperDate == nil ? lowerDate : nil }
    func update(_ date: Date) { lowerDate = date.dateWithoutTime }
}

extension MDate {
    func getRange() -> ClosedRange<Date>? { (lowerDate...upperDate) }
    func contains(_ date: Date) -> Bool { (lowerDate...upperDate)?.contains(date) == true }
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
        if lowerDate == nil { lowerDate = date.dateWithoutTime }
        else if upperDate == nil { upperDate = date.dateWithoutTime }
        else { addDateToExistedRange(date: date.dateWithoutTime) }
    }
}

private extension MDate {
    func addDateToExistedRange(date: Date) {
        guard getRange()?.contains(date) == false else { return }
        if date < lowerDate ?? Date() { lowerDate = date }
        else if date > upperDate ?? Date() { upperDate = date }
    }
}

// MARK: Helpers
fileprivate extension Date {
    func add(days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: days, to: self) ?? self
    }
    var dateWithoutTime: Date {
        let calendar = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return Calendar.current.date(from: calendar) ?? self
    }
    static func ==(_ rhs: Date?, _ lhs: Date) -> Bool {
        guard let rhs else { return false }
        return rhs.dateWithoutTime == lhs.dateWithoutTime
    }
}

fileprivate func ...(_ lhs: Date?, _ rhs: Date?) -> ClosedRange<Date>? {
    if let lhs, let rhs { return .init(uncheckedBounds: (lhs, rhs)) }
    return nil
}
