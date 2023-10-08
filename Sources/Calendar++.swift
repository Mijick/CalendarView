//
//  Calendar++.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

extension Calendar {
    init(firstWeekday: Int, locale: Locale) {
        self.init(identifier: .gregorian)
        self.firstWeekday = firstWeekday
        self.locale = locale
    }
}
