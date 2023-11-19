//
//  MWeekdaysTest.swift of CalendarView
//
//  Created by Alina Petrovska on 04.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import XCTest
@testable import MijickCalendarView

final class MWeekdaysTest: XCTestCase { }

// MARK: allCases
extension MWeekdaysTest {
    func testAllCases_weekStartsOnFriday() {
        MCalendar.firstWeekday = .friday
        let weekdays = MWeekday.allCases
        let expectedWeekdays: [MWeekday] = [.friday, .saturday, .sunday, .monday, .tuesday, .wednesday, .thursday]
        
        XCTAssertEqual(weekdays, expectedWeekdays)
    }
    func testAllCases_weekStartsOnSunday() {
        MCalendar.firstWeekday = .sunday
        let weekdays = MWeekday.allCases
        let expectedWeekdays: [MWeekday] = [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]
        
        XCTAssertEqual(weekdays, expectedWeekdays)
    }
    func testAllCases_weekStartsOnWednesday() {
        MCalendar.firstWeekday = .wednesday
        let weekdays = MWeekday.allCases
        let expectedWeekdays: [MWeekday] = [.wednesday, .thursday, .friday, .saturday, .sunday, .monday, .tuesday]
        
        XCTAssertEqual(weekdays, expectedWeekdays)
    }
}
