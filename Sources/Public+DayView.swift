//
//  DayView.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

public protocol DayView: View {
    // ATTRIBUTES
    var date: Date { get }
    var selectedDate: Binding<Date?>? { get }
    var selectedRange: Binding<MDateRange?>? { get }
    var calendar: MCalendar { get }

    // VIEW CUSTOMISATION
    func createContent() -> AnyView
    func createDayLabel() -> AnyView
    func createSelectionView() -> AnyView
    func createRangeSelectionView() -> AnyView

    // LOGIC
    func onAppear()
    func onSelection()
}

// MARK: - Customising View
public extension DayView {
    func createContent() -> AnyView { createDefaultContent().erased() }
    func createDayLabel() -> AnyView { createDefaultDayLabel().erased() }
    func createSelectionView() -> AnyView { createDefaultSelectionView().erased() }
    func createRangeSelectionView() -> AnyView { createDefaultRangeSelectionView().erased() }

    var body: some View { createBody() }
}
private extension DayView {
    func createBody() -> some View {
        createContent()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
            .onAppear(perform: onAppear)
            .onTapGesture(perform: onSelection)
    }
    func createDefaultContent() -> some View { ZStack {
        createSelectionView()
        createRangeSelectionView()
        createDayLabel()
    }}
    func createDefaultDayLabel() -> some View {
        Text(getStringFromDay(format: "d"))
            .font(.system(size: 14))
            .foregroundColor(.black)
            .opacity(isPreviousMonth() || isNextMonth() ? 0.36 : 1)
    }
    func createDefaultSelectionView() -> some View {
        Circle()
            .fill(.blue)
            .transition(.scale(scale: 0.4).combined(with: .opacity))
            .active(if: isSelected())
    }
    func createDefaultRangeSelectionView() -> some View {
        EmptyView()
    }
}

// MARK: - Handling Actions
public extension DayView {
    func onAppear() {}
    func onSelection() { selectedDate?.wrappedValue = date }
}

// MARK: - Text Formatting
public extension DayView {
    func getStringFromDay(format: String) -> String { calendar.formatter.getString(from: date, format: format) }
}

// MARK: - Helper Flags
public extension DayView {
    func isPreviousMonth() -> Bool { date.isBefore(.month, than: .init()) }
    func isToday() -> Bool { date.isSame(.day, as: .init()) }
    func isNextMonth() -> Bool { date.isLater(.month, than: .init()) }
    func isSelected() -> Bool { date.isSame(.day, as: selectedDate?.wrappedValue) }
    func isWithinRange() -> Bool { false }
}
