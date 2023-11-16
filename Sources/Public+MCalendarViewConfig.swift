//
//  Public+MCalendarViewConfig.swift of
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

// MARK: - Range
extension MCalendarView.Config {
    public func startMonth(_ value: Date?) -> Self { changing(path: \.startMonth, to: value) }
    public func endMonth(_ value: Date?) -> Self { changing(path: \.endMonth, to: value) }
}

// MARK: - Calendar
extension MCalendarView.Config {
    public func firstWeekday(_ value: MWeekday) -> Self { changing(path: \.calendar.firstWeekday, to: value) }
    public func locale(_ value: Locale) -> Self { changing(path: \.calendar.locale, to: value) }
}


// MARK: - Internal
extension MCalendarView { public struct Config: Configurable { public init() {}
    private(set) var startMonth: Date? = nil
    private(set) var endMonth: Date? = nil

    private(set) var calendar: MCalendar = .init()
}}
