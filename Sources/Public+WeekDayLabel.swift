//
//  Public+WeekDayLabel.swift of CalendarView
//
//  Created by Alina Petrovska on 13.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

public protocol WeekDayLabel: MView {
    var calendar: MCalendar { get }
    var weekday: MWeekday { get }
}

public extension WeekDayLabel {
    func getString(with format: WeekdaySymbolFormat) -> String { calendar.getWeekdaySymbol(weekday, format: format) }
}
