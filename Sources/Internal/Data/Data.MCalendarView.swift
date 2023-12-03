//
//  Data.MCalendarView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Data { class MCalendarView: ObservableObject {
    @Published var date: Date? { didSet { updateDateBinding() }}
    @Published var range: MDateRange? { didSet { updateDateRangeBinding() }}
    private var p_date: Binding<Date?>?
    private var p_range: Binding<MDateRange?>?


    init(_ selectedDate: Binding<Date?>?, _ selectedRange: Binding<MDateRange?>?) {
        self._date = .init(wrappedValue: selectedDate?.wrappedValue)
        self._range = .init(wrappedValue: selectedRange?.wrappedValue)

        self.p_date = selectedDate
        self.p_range = selectedRange
    }
}}
private extension Data.MCalendarView {
    func updateDateBinding() { p_date?.wrappedValue = date }
    func updateDateRangeBinding() { p_range?.wrappedValue = range }
}
