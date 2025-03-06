//
//  MCalendarView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

public struct MCalendarView: View {
    @Binding var selectedDate: Date?
    @Binding var selectedRange: MDateRange?
    let monthsData: [Data.MonthView]
    let configData: CalendarConfig

    init(
        _ selectedDate: Binding<Date?>, _ selectedRange: Binding<MDateRange?>,
        _ configBuilder: (CalendarConfig) -> CalendarConfig
    ) {
        _selectedDate = selectedDate
        _selectedRange = selectedRange
        self.configData = configBuilder(.init())
        self.monthsData = .generate()
    }

    public var body: some View {
        VStack(spacing: 12) {
            createWeekdaysView()
            createScrollView()
        }
    }
}
extension MCalendarView {
    fileprivate func createWeekdaysView() -> some View {
        configData.weekdaysView().erased()
    }
    fileprivate func createScrollView() -> some View {
        ScrollViewReader { reader in
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: configData.monthsSpacing) {
                    ForEach(monthsData, id: \.month, content: createMonthItem)
                }
                .padding(.top, configData.monthsPadding.top)
                .padding(.bottom, configData.monthsPadding.bottom)
                .background(configData.monthsViewBackground)
            }
            .onAppear { scrollToDate(reader, animatable: false) }
            .onChange(of: selectedDate) { newdate in
                guard let date = newdate else { return }
                withAnimation {
                    reader.scrollTo(date.start(of: .month), anchor: .top)
                }
            }
        }
    }
}
extension MCalendarView {
    fileprivate func createMonthItem(_ data: Data.MonthView) -> some View {
        VStack(spacing: configData.monthLabelDaysSpacing) {
            createMonthLabel(data.month)
            createMonthView(data)
        }
    }
}
extension MCalendarView {
    fileprivate func createMonthLabel(_ month: Date) -> some View {
        configData.monthLabel(month)
            .erased()
            .onAppear { onMonthChange(month) }
    }
    fileprivate func createMonthView(_ data: Data.MonthView) -> some View {
        MonthView(
            selectedDate: $selectedDate, selectedRange: $selectedRange, data: data,
            config: configData)
    }
}

// MARK: - Modifiers
extension MCalendarView {
    fileprivate func scrollToDate(_ reader: ScrollViewProxy, animatable: Bool) {
        guard let date = configData.scrollDate else { return }

        let scrollDate = date.start(of: .month)
        withAnimation(animatable ? .default : nil) { reader.scrollTo(scrollDate, anchor: .center) }
    }
    fileprivate func onMonthChange(_ date: Date) { configData.onMonthChange(date) }
}
