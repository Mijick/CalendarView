//
//  Date++.swift of MijickCalendarView
//
//  Created by Alina Petrovska on 06.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import Foundation

extension Date {
    static var now: Date {
        let calendar = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        return Calendar.current.date(from: calendar) ?? Date()
    }
    static var yesterday: Date { now.add(-1) }
    static var tomorrow: Date { now.add(1) }
    static var dayBeforeYesterday: Date { now.add(-2) }
    static var dayAfterTomorrow: Date { now.add(2) }
}

private extension Date {
    func add(_ days: Int) -> Date { Calendar.current.date(byAdding: .day, value: days, to: self) ?? self }
}
