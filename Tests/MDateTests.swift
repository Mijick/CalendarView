//
//  MDateTests.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import XCTest
@testable import MijickCalendarView

final class MDateTests: XCTestCase {}

// MARK: - Is Date Same
extension MDateTests {
    func testIsDateSame_day_1() {
        let date1 = "2023-12-01".toMDate()
        let date2 = "2023-12-01".toDate()

        let result = date1.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateSame_day_2() {
        let date1 = "2023-10-01".toMDate()
        let date2 = "2023-12-01".toDate()

        let result = date1.isSame(.day, as: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateSame_month_1() {
        let date1 = "2023-10-01".toMDate()
        let date2 = "2023-10-31".toDate()

        let result = date1.isSame(.month, as: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateSame_month_2() {
        let date1 = "2023-09-30".toMDate()
        let date2 = "2023-10-01".toDate()

        let result = date1.isSame(.month, as: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateSame_year_1() {
        let date1 = "2023-01-30".toMDate()
        let date2 = "2023-07-01".toDate()

        let result = date1.isSame(.year, as: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateSame_year_2() {
        let date1 = "2023-01-30".toMDate()
        let date2 = "2024-01-30".toDate()

        let result = date1.isSame(.year, as: date2)
        XCTAssertEqual(result, false)
    }
}

// MARK: - Is Date Earlier
extension MDateTests {
    func testIsDateEarlier_day_1() {
        let date1 = "2023-01-01".toMDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.day, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateEarlier_day_2() {
        let date1 = "2022-12-31".toMDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.day, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateEarlier_month_1() {
        let date1 = "2022-12-31".toMDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.month, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateEarlier_month_2() {
        let date1 = "2024-12-31".toMDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.month, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateEarlier_year_1() {
        let date1 = "2024-01-01".toMDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.year, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateEarlier_year_2() {
        let date1 = "2024-01-01".toMDate()
        let date2 = "2025-01-01".toDate()

        let result = date1.isBefore(.year, than: date2)
        XCTAssertEqual(result, true)
    }
}

// MARK: - Is Date Later
extension MDateTests {
    func testIsDateLater_day_1() {
        let date1 = "2024-11-30".toMDate()
        let date2 = "2024-11-29".toDate()

        let result = date1.isLater(.day, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateLater_day_2() {
        let date1 = "2024-11-30".toMDate()
        let date2 = "2024-11-30".toDate()

        let result = date1.isLater(.day, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateLater_month_1() {
        let date1 = "2024-11-30".toMDate()
        let date2 = "2024-11-01".toDate()

        let result = date1.isLater(.month, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateLater_month_2() {
        let date1 = "2025-11-01".toMDate()
        let date2 = "2024-11-01".toDate()

        let result = date1.isLater(.month, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateLater_year_1() {
        let date1 = "2025-01-01".toMDate()
        let date2 = "2024-01-01".toDate()

        let result = date1.isLater(.year, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateLater_year_2() {
        let date1 = "2024-12-01".toMDate()
        let date2 = "2024-01-01".toDate()

        let result = date1.isLater(.year, than: date2)
        XCTAssertEqual(result, false)
    }
}

// MARK: - Adding
extension MDateTests {
    func testAddingToDate_hour_1() {
        let date1 = "2023-04-29".toMDate()
        let date2 = date1.adding(24, .hour)

        let expectedDate = "2023-04-30".toMDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testAddingToDate_day_1() {
        let date1 = "2023-04-29".toMDate()
        let date2 = date1.adding(1, .day)

        let expectedDate = "2023-04-30".toMDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testAddingToDate_day_2() {
        let date1 = "2023-04-29".toMDate()
        let date2 = date1.adding(13, .day)

        let expectedDate = "2023-05-12".toMDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testAddingToDate_month_1() {
        let date1 = "2023-04-29".toMDate()
        let date2 = date1.adding(1, .month)

        let expectedDate = "2023-05-29".toMDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testAddingToDate_year_1() {
        let date1 = "2023-04-29".toMDate()
        let date2 = date1.adding(100, .year)

        let expectedDate = "2123-04-29".toMDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
}

// MARK: - Getting Weekdays
extension MDateTests {
    func testGetWeekday_1() {
        let date = "2023-04-29".toMDate()
        let weekday = date.getWeekday()

        XCTAssertEqual(weekday, .saturday)
    }
    func testGetWeekday_2() {
        let date = "2024-04-29".toMDate()
        let weekday = date.getWeekday()

        XCTAssertEqual(weekday, .monday)
    }
    func testGetWeekday_3() {
        let date = "2023-12-29".toMDate()
        let weekday = date.getWeekday()

        XCTAssertEqual(weekday, .friday)
    }
    func testGetWeekday_4() {
        let date = "2000-01-01".toMDate()
        let weekday = date.getWeekday()

        XCTAssertEqual(weekday, .saturday)
    }
}

// MARK: - Start of Months
extension MDateTests {
    func testMonthStart_1() {
        let date = "2023-04-29".toMDate()
        let monthStartDate = date.startOfMonth()

        let expectedResult = "2023-04-01".toDate()
        XCTAssertEqual(expectedResult, monthStartDate)
    }
    func testMonthStart_2() {
        let date = "2023-12-31".toMDate()
        let monthStartDate = date.startOfMonth()

        let expectedResult = "2023-12-01".toDate()
        XCTAssertEqual(expectedResult, monthStartDate)
    }
    func testMonthStart_3() {
        let date = "2023-12-01".toMDate()
        let monthStartDate = date.startOfMonth()

        let expectedResult = "2023-12-01".toDate()
        XCTAssertEqual(expectedResult, monthStartDate)
    }
    func testMonthStart_4() {
        let date = "2023-02-28".toMDate()
        let monthStartDate = date.startOfMonth()

        let expectedResult = "2023-02-01".toDate()
        XCTAssertEqual(expectedResult, monthStartDate)
    }
}


// MARK: - Helpers
fileprivate extension String {
    func toMDate() -> MDate { .init(date: toDate(), .init(identifier: .gregorian), .monday) }
}
