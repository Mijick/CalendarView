//
//  MCalendarTests.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import XCTest
@testable import MijickCalendarView

final class MCalendarTests: XCTestCase {}

// MARK: - Weekday Symbols
extension MCalendarTests {
    func testWeekdaySymbols_englishLocale_weekStartsOnMonday() {
        let weekdaySymbols = MCalendar(firstWeekday: .monday, locale: .english).getWeekdaySymbols(format: .full)
        let expectedWeekdaySymbols = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
    func testWeekdaySymbols_englishLocale_weekStartsOnSunday() {
        let weekdaySymbols = MCalendar(firstWeekday: .sunday, locale: .english).getWeekdaySymbols(format: .full)
        let expectedWeekdaySymbols = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
    func testWeekdaySymbols_englishLocale_weekStartsOnWednesday() {
        let weekdaySymbols = MCalendar(firstWeekday: .wednesday, locale: .english).getWeekdaySymbols(format: .full)
        let expectedWeekdaySymbols = ["Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }

    func testWeekdaySymbols_polishLocale_weekStartsOnTuesday() {
        let weekdaySymbols = MCalendar(firstWeekday: .tuesday, locale: .polish).getWeekdaySymbols(format: .full)
        let expectedWeekdaySymbols = ["Wtorek", "Środa", "Czwartek", "Piątek", "Sobota", "Niedziela", "Poniedziałek"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }

    func testShortWeekdaySymbols_englishLocale_weekStartsOnMonday() {
        let weekdaySymbols = MCalendar(firstWeekday: .monday, locale: .english).getWeekdaySymbols(format: .short)
        let expectedWeekdaySymbols = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
    func testShortWeekdaySymbols_polishLocale_weekStartsOnThursday() {
        let weekdaySymbols = MCalendar(firstWeekday: .thursday, locale: .polish).getWeekdaySymbols(format: .short)
        let expectedWeekdaySymbols = ["Czw.", "Pt.", "Sob.", "Niedz.", "Pon.", "Wt.", "Śr."]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }

    func testVeryShortWeekdaySymbols_englishLocale_weekStartsOnMonday() {
        let weekdaySymbols = MCalendar(firstWeekday: .monday, locale: .english).getWeekdaySymbols(format: .veryShort)
        let expectedWeekdaySymbols = ["M", "T", "W", "T", "F", "S", "S"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
    func testVeryShortWeekdaySymbols_polishLocale_weekStartsOnSaturday() {
        let weekdaySymbols = MCalendar(firstWeekday: .sunday, locale: .polish).getWeekdaySymbols(format: .veryShort)
        let expectedWeekdaySymbols = ["N", "P", "W", "Ś", "C", "P", "S"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
}

// MARK: - Days in week
extension MCalendarTests {
    func testMaxNumberOfDaysInAWeek() {
        let numberOfDays = MCalendar(firstWeekday: .sunday, locale: .polish).maxNumberOfDays
        let expectedNumberOfDays = 7

        XCTAssertEqual(numberOfDays, expectedNumberOfDays)
    }
}
