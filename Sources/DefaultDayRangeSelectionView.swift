//
//  DefaultDayRangeSelectionView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct DefaultDayRangeSelectionView: DayView {
    var date: Date
    var month: Date
    var selectedDate: Binding<Date?>?
    var selectedRange: Binding<MDateRange?>?
    var calendar: MCalendar
}

extension DefaultDayRangeSelectionView {
    func onSelection() { selectedRange?.wrappedValue?.addToRange(date) }
}
