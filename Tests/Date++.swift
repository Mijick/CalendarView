//
//  File.swift
//  
//
//  Created by Alina Petrovska on 06.11.2023.
//

import Foundation

extension Date {
    static var now: Date {
        let calendar = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        return Calendar.current.date(from: calendar) ?? Date()
    }
    static var yesterday: Date { now.add(-1) }
    static var tomorrow: Date { now.add(1) }
    static var beforeYesterday: Date { now.add(-2) }
    static var afterTomorrow: Date { now.add(2) }
}

private extension Date {
    func add(_ days: Int) -> Date { Calendar.current.date(byAdding: .day, value: days, to: self) ?? self }
}
