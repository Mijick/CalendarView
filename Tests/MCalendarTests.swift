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
        let weekdaySymbols = MCalendar(firstWeekday: 2, localeIdentifier: "EN").getWeekdaySymbols()
        let expectedWeekdaySymbols = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
    func testWeekdaySymbols_englishLocale_weekStartsOnSunday() {
        let weekdaySymbols = MCalendar(firstWeekday: 1, localeIdentifier: "EN").getWeekdaySymbols()
        let expectedWeekdaySymbols = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
    func testWeekdaySymbols_englishLocale_weekStartsOnWednesday() {
        let weekdaySymbols = MCalendar(firstWeekday: 4, localeIdentifier: "EN").getWeekdaySymbols()
        let expectedWeekdaySymbols = ["Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }

    func testWeekdaySymbols_polishLocale_weekStartsOnTuesday() {
        let weekdaySymbols = MCalendar(firstWeekday: 3, localeIdentifier: "PL").getWeekdaySymbols()
        let expectedWeekdaySymbols = ["Wtorek", "Środa", "Czwartek", "Piątek", "Sobota", "Niedziela", "Poniedziałek"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }

    func testShortWeekdaySymbols_englishLocale_weekStartsOnMonday() {
        let weekdaySymbols = MCalendar(firstWeekday: 2, localeIdentifier: "EN").getShortWeekdaySymbols()
        let expectedWeekdaySymbols = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
    func testShortWeekdaySymbols_polishLocale_weekStartsOnThursday() {
        let weekdaySymbols = MCalendar(firstWeekday: 5, localeIdentifier: "PL").getShortWeekdaySymbols()
        let expectedWeekdaySymbols = ["Czw.", "Pt.", "Sob.", "Niedz.", "Pon.", "Wt.", "Śr."]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }

    func testVeryShortWeekdaySymbols_englishLocale_weekStartsOnMonday() {
        let weekdaySymbols = MCalendar(firstWeekday: 2, localeIdentifier: "EN").getVeryShortWeekdaySymbols()
        let expectedWeekdaySymbols = ["M", "T", "W", "T", "F", "S", "S"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
    func testVeryShortWeekdaySymbols_polishLocale_weekStartsOnSaturday() {
        let weekdaySymbols = MCalendar(firstWeekday: 7, localeIdentifier: "PL").getVeryShortWeekdaySymbols()
        let expectedWeekdaySymbols = ["S", "N", "P", "W", "Ś", "C", "P"]

        XCTAssertEqual(weekdaySymbols, expectedWeekdaySymbols)
    }
}
