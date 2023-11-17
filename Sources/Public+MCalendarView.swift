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
        configData.weekdaysView(configData.calendar).erased()
    }
    func createScrollView() -> some View { ScrollViewReader { reader in
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 24) {
                ForEach(monthsData, id: \.month, content: createMonthItem)
            }
        }
        .onAppear() { scrollToDate(reader, animatable: false) }
        .onChange(of: configData.scrollDate) { _ in scrollToDate(reader, animatable: true) }
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
        configData.monthLabel(month, configData.calendar)
            .erased()
            .onAppear { onMonthChange(month) }
    }
    func createMonthView(_ data: Data.MonthView) -> some View {
        MonthView(selectedDate: $selectedData.date, selectedRange: $selectedData.range, data: data, calendar: configData.calendar)
    }
}

// MARK: - Modifiers
private extension MCalendarView {
    func scrollToDate(_ reader: ScrollViewProxy, animatable: Bool) {
        guard let date = configData.scrollDate else { return }

        let scrollDate = configData.calendar.mDate(date).startOfMonth()
        withAnimation(animatable ? .smooth : nil) { reader.scrollTo(scrollDate, anchor: .center) }
    }
    func onMonthChange(_ date: Date) { configData.onMonthChange(date) }
}
