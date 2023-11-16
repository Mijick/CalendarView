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

public struct MCalendarView: View {
    @StateObject private var selectedData: Data.MCalendarView
    private let monthsData: [Data.MonthView]
    private let configData: Config


    public init(selectedDate: Binding<Date?>?, selectedRange: Binding<MDateRange?>?, configBuilder: (Config) -> Config = { $0 }) {
        self._selectedData = .init(wrappedValue: .init(selectedDate, selectedRange))
        self.configData = configBuilder(.init())
        self.monthsData = .generate(startMonth: configData.startMonth, endMonth: configData.endMonth, calendar: configData.calendar)
    }
    public var body: some View {
        VStack(spacing: 12) {
            createWeekdaysView()
            createScrollView()
        }
    }
}
private extension MCalendarView {
    func createWeekdaysView() -> some View {
        DefaultWeekdaysView(calendar: configData.calendar)
    }
    func createScrollView() -> some View { ScrollView(showsIndicators: false) {
        LazyVStack(spacing: 24) {
            ForEach(monthsData, id: \.month, content: createMonthItem)
        }
    }}
}
private extension MCalendarView {
    func createMonthItem(_ data: Data.MonthView) -> some View {
        VStack(spacing: 12) {
            createMonthLabel(data.month)
            createMonthView(data)
        }
    }
}
private extension MCalendarView {
    func createMonthLabel(_ month: Date) -> some View {
        DefaultMonthLabel(month: month, calendar: configData.calendar)
    }
    func createMonthView(_ data: Data.MonthView) -> some View {
        MonthView(selectedDate: $selectedData.date, selectedRange: $selectedData.range, data: data, calendar: configData.calendar)
    }
}


// MARK: - Preview
#Preview {
    struct Preview: View {
        @State private var selectedDate: Date? = nil
        @State private var selectedRange: MDateRange? = .init()


        var body: some View { MCalendarView(
            selectedDate: $selectedDate,
            selectedRange: $selectedRange
        )}
    }

    return Preview().padding(.horizontal, 32)
}
