//
//  Public+MCalendarView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension MCalendarView {
    public init(
      selectedDate: Binding<Date?>,
      selectedRange: Binding<MDateRange?>,
      configBuilder: (CalendarConfig) -> CalendarConfig = { $0 }
    ) {
      self.init(selectedDate, selectedRange, configBuilder)
    }
}
