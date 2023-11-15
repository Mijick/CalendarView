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
    // MARK: Attributes
    var date: Date { get }
    var month: Date { get }
    var selectedDate: Binding<Date?>? { get }
    var selectedRange: Binding<MDateRange?>? { get }
    var calendar: MCalendar { get }

    // MARK: View Customisation
    func createContent() -> AnyView
    func createDayLabel() -> AnyView
    func createSelectionView() -> AnyView
    func createRangeSelectionView() -> AnyView

    // MARK: Logic
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
            .padding(.vertical, 1)
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
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(isSelected() ? .white : .black)
            .opacity(isCurrentMonth() ? 1 : 0)
    }
    func createDefaultSelectionView() -> some View {
        Circle()
            .fill(.black)
            .transition(.scale(scale: 0.6).combined(with: .opacity))
            .active(if: isSelected() && isCurrentMonth())
    }
    func createDefaultRangeSelectionView() -> some View {
        RoundedCorner(radius: .infinity, corners: rangeSelectionViewCorners)
            .fill(.black.opacity(0.12))
            .transition(.opacity)
            .active(if: isWithinRange())
    }
}
private extension DayView {
    var rangeSelectionViewCorners: UIRectCorner { 
        if isBeginningOfRange() { return [.topLeft, .bottomLeft] }
        if isEndOfRange() { return [.topRight, .bottomRight] }

        return []
    }
}

// MARK: - Handling Actions
public extension DayView {
    func onAppear() {}
    func onSelection() { if isCurrentMonth() { selectedDate?.wrappedValue = date }}
}

// MARK: - Text Formatting
public extension DayView {
    func getStringFromDay(format: String) -> String { calendar.formatter().getString(from: date, format: format) }
}

// MARK: - Date Helpers
public extension DayView {
    func isPast() -> Bool { calendar.mDate(date).isBefore(.day, than: .now) }
    func isToday() -> Bool { calendar.mDate(date).isSame(.day, as: .now) }
    func isCurrentMonth() -> Bool { calendar.mDate(date).isSame(.month, as: month) }
}

// MARK: - Day Selection Helpers
public extension DayView {
    func isSelected() -> Bool { calendar.mDate(date).isSame(.day, as: selectedDate?.wrappedValue) || isBeginningOfRange() || isEndOfRange() }
}

// MARK: - Range Selection Helpers
public extension DayView {
    func isBeginningOfRange() -> Bool { calendar.mDate(date).isSame(.day, as: selectedRange?.wrappedValue?.getRange()?.lowerBound) }
    func isEndOfRange() -> Bool { calendar.mDate(date).isSame(.day, as: selectedRange?.wrappedValue?.getRange()?.upperBound) }
    func isWithinRange() -> Bool { selectedRange?.wrappedValue?.isRangeCompleted() == true && selectedRange?.wrappedValue?.contains(date) == true }
}
