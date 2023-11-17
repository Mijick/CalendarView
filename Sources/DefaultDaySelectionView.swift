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

struct DefaultDaySelectionView: DayView {
    var date: Date
    var isCurrentMonth: Bool
    var selectedDate: Binding<Date?>?
    var selectedRange: Binding<MDateRange?>?
}


// MARK: - Preview
#Preview {
    struct Preview: View {
        @State private var selectedDate: Date? = nil
        @State private var selectedRange: Binding<MDateRange?>? = nil
        private let date: Date = .now


        var body: some View { DefaultDaySelectionView(
            date: date,
            isCurrentMonth: true,
            selectedDate: $selectedDate,
            selectedRange: selectedRange
        )}
    }

    return Preview()
}
