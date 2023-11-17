//
//  DefaultDaySelectionView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

public struct DefaultDaySelectionView: DayView {
    public let date: Date
    public let isCurrentMonth: Bool
    public let selectedDate: Binding<Date?>?
    public let selectedRange: Binding<MDateRange?>?

    public init(date: Date, isCurrentMonth: Bool, selectedDate: Binding<Date?>? = nil, selectedRange: Binding<MDateRange?>? = nil) {
        self.date = date
        self.isCurrentMonth = isCurrentMonth
        self.selectedDate = selectedDate
        self.selectedRange = selectedRange
    }
}
