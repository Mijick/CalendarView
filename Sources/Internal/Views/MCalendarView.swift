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
    
    @State var monthIndex = 0

    init(
        _ selectedDate: Binding<Date?>, _ selectedRange: Binding<MDateRange?>,
        _ configBuilder: (CalendarConfig) -> CalendarConfig
    ) {
        _selectedDate = selectedDate
        _selectedRange = selectedRange
        self.configData = configBuilder(.init())
        self.monthsData = .generate()
        _monthIndex = State(initialValue: monthsData.count - 1)
    }

    public var body: some View {
        VStack(spacing: 12) {
            createScrollView()
        }
    }
}
extension MCalendarView {
   
    fileprivate func createScrollView() -> some View {
//        ScrollViewReader { reader in
            TabView(selection: $monthIndex) {
                ForEach(Array(monthsData.enumerated()), id: \.element) { index, month in
                    createMonthItem(month).tag(index)
                }
//                LazyHStack(spacing: configData.monthsSpacing) {
//                    ForEach(monthsData, id: \.month, content: createMonthItem)
//                }
                .padding(.top, configData.monthsPadding.top)
                .padding(.bottom, configData.monthsPadding.bottom)
                .background(configData.monthsViewBackground)
            }
            .frame(height: 425)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: selectedDate) { newdate in
                guard let date = newdate else { return }
                var index = 0
                monthsData.forEach{ month in
                    month.items.forEach{ week in
                        week.forEach{ item in
                            if item.dateOnly == date.dateOnly {
                                monthIndex = index
                            }
                        }
                    }
                    index+=1
                }
                withAnimation {
//                    reader.scrollTo(date.start(of: .month), anchor: .top)
                }
            }
            .onAppear{
                var index = 0
                monthsData.forEach{ month in
                    month.items.forEach{ week in
                        week.forEach{ item in
                            if item.dateOnly == selectedDate?.dateOnly {
                                monthIndex = index
                            }
                        }
                    }
                    index+=1
                }
            }
//            .scrollTargetBehavior(.paging)
//            .onAppear { scrollToDate(reader, animatable: false) }
//            .onChange(of: selectedDate) { newdate in
//                guard let date = newdate else { return }
//                withAnimation {
//                    reader.scrollTo(date.start(of: .month), anchor: .top)
//                }
//            }
//        }
    }
}
extension MCalendarView {
    
    
    fileprivate func createMonthItem(_ data: Data.MonthView) -> some View {
        VStack(alignment: .leading,spacing: configData.monthLabelDaysSpacing) {
            createMonthLabel(data.month)
            createWeekdaysView()
            createMonthView(data)
            Spacer()
        }
        .frame(maxHeight: .infinity, alignment: .leading)
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
            selectedDate: $selectedDate,
            selectedRange: $selectedRange,
            selectedMonthIndex: $monthIndex,
            data: data,
            config: configData
        )
    }
    
    fileprivate func createWeekdaysView() -> some View {
        configData.weekdaysView().erased()
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


extension Date {
    public var dateOnly: Date? {
        let kalender = Calendar.current
        let komponenTanggal = kalender.dateComponents([.year, .month, .day], from: self)

        return kalender.date(from: komponenTanggal)
    }
}
