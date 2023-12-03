//
//  DateTests.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import XCTest
@testable import MijickCalendarView

final class DateTests: XCTestCase {}

// MARK: - Is Date Same
extension DateTests {
    func testIsDateSame_day_1() {
        let date1 = "2023-12-01".toDate()
        let date2 = "2023-12-01".toDate()

        let result = date1.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateSame_day_2() {
        let date1 = "2023-10-01".toDate()
        let date2 = "2023-12-01".toDate()

        let result = date1.isSame(.day, as: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateSame_month_1() {
        let date1 = "2023-10-01".toDate()
        let date2 = "2023-10-31".toDate()

        let result = date1.isSame(.month, as: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateSame_month_2() {
        let date1 = "2023-09-30".toDate()
        let date2 = "2023-10-01".toDate()

        let result = date1.isSame(.month, as: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateSame_year_1() {
        let date1 = "2023-01-30".toDate()
        let date2 = "2023-07-01".toDate()

        let result = date1.isSame(.year, as: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateSame_year_2() {
        let date1 = "2023-01-30".toDate()
        let date2 = "2024-01-30".toDate()

        let result = date1.isSame(.year, as: date2)
        XCTAssertEqual(result, false)
    }
}

// MARK: - Is Date Earlier
extension DateTests {
    func testIsDateEarlier_day_1() {
        let date1 = "2023-01-01".toDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.day, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateEarlier_day_2() {
        let date1 = "2022-12-31".toDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.day, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateEarlier_month_1() {
        let date1 = "2022-12-31".toDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.month, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateEarlier_month_2() {
        let date1 = "2024-12-31".toDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.month, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateEarlier_year_1() {
        let date1 = "2024-01-01".toDate()
        let date2 = "2023-01-01".toDate()

        let result = date1.isBefore(.year, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateEarlier_year_2() {
        let date1 = "2024-01-01".toDate()
        let date2 = "2025-01-01".toDate()

        let result = date1.isBefore(.year, than: date2)
        XCTAssertEqual(result, true)
    }
}

// MARK: - Is Date Later
extension DateTests {
    func testIsDateLater_day_1() {
        let date1 = "2024-11-30".toDate()
        let date2 = "2024-11-29".toDate()

        let result = date1.isLater(.day, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateLater_day_2() {
        let date1 = "2024-11-30".toDate()
        let date2 = "2024-11-30".toDate()

        let result = date1.isLater(.day, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateLater_month_1() {
        let date1 = "2024-11-30".toDate()
        let date2 = "2024-11-01".toDate()

        let result = date1.isLater(.month, than: date2)
        XCTAssertEqual(result, false)
    }
    func testIsDateLater_month_2() {
        let date1 = "2025-11-01".toDate()
        let date2 = "2024-11-01".toDate()

        let result = date1.isLater(.month, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateLater_year_1() {
        let date1 = "2025-01-01".toDate()
        let date2 = "2024-01-01".toDate()

        let result = date1.isLater(.year, than: date2)
        XCTAssertEqual(result, true)
    }
    func testIsDateLater_year_2() {
        let date1 = "2024-12-01".toDate()
        let date2 = "2024-01-01".toDate()

        let result = date1.isLater(.year, than: date2)
        XCTAssertEqual(result, false)
    }
}

// MARK: - Distance Between Dates
extension DateTests {
    func testDistanceBetweenDates_hours_1() {
        let date1 = "2024-11-01 1:46".toDate(format: "yyyy-MM-dd HH:mm")
        let date2 = "2024-11-03 4:21".toDate(format: "yyyy-MM-dd HH:mm")

        let result = date1.distance(to: date2, in: .hour)
        XCTAssertEqual(result, 50)
    }
    func testDistanceBetweenDates_days_1() {
        let date1 = "2024-10-29".toDate()
        let date2 = "2024-11-03".toDate()

        let result = date1.distance(to: date2, in: .day)
        XCTAssertEqual(result, 5)
    }
    func testDistanceBetweenDates_days_2() {
        let date1 = "2024-10-29".toDate()
        let date2 = "2024-12-03".toDate()

        let result = date1.distance(to: date2, in: .day)
        XCTAssertEqual(result, 35)
    }
    func testDistanceBetweenDates_months_1() {
        let date1 = "2024-10-29".toDate()
        let date2 = "2024-10-29".toDate()

        let result = date1.distance(to: date2, in: .month)
        XCTAssertEqual(result, 0)
    }
    func testDistanceBetweenDates_months_2() {
        let date1 = "2024-10-29".toDate()
        let date2 = "2024-12-03".toDate()

        let result = date1.distance(to: date2, in: .month)
        XCTAssertEqual(result, 1)
    }
    func testDistanceBetweenDates_year_1() {
        let date1 = "2024-10-29".toDate()
        let date2 = "2024-12-03".toDate()

        let result = date1.distance(to: date2, in: .year)
        XCTAssertEqual(result, 0)
    }
    func testDistanceBetweenDates_year_2() {
        let date1 = "2024-10-29".toDate()
        let date2 = "2025-11-03".toDate()

        let result = date1.distance(to: date2, in: .year)
        XCTAssertEqual(result, 1)
    }
}

// MARK: - Adding
extension DateTests {
    func testAddingToDate_hour_1() {
        let date1 = "2023-04-29".toDate()
        let date2 = date1.adding(24, .hour)

        let expectedDate = "2023-04-30".toDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testAddingToDate_day_1() {
        let date1 = "2023-04-29".toDate()
        let date2 = date1.adding(1, .day)

        let expectedDate = "2023-04-30".toDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testAddingToDate_day_2() {
        let date1 = "2023-04-29".toDate()
        let date2 = date1.adding(13, .day)

        let expectedDate = "2023-05-12".toDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testAddingToDate_month_1() {
        let date1 = "2023-04-29".toDate()
        let date2 = date1.adding(1, .month)

        let expectedDate = "2023-05-29".toDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
    func testAddingToDate_year_1() {
        let date1 = "2023-04-29".toDate()
        let date2 = date1.adding(100, .year)

        let expectedDate = "2123-04-29".toDate()
        let result = expectedDate.isSame(.day, as: date2)
        XCTAssertEqual(result, true)
    }
}

// MARK: - Getting Weekdays
extension DateTests {
    func testGetWeekday_1() {
        let date = "2023-04-29".toDate()
        let weekday = date.getWeekday()

        XCTAssertEqual(weekday, .saturday)
    }
    func testGetWeekday_2() {
        let date = "2024-04-29".toDate()
        let weekday = date.getWeekday()

        XCTAssertEqual(weekday, .monday)
    }
    func testGetWeekday_3() {
        let date = "2023-12-29".toDate()
        let weekday = date.getWeekday()

        XCTAssertEqual(weekday, .friday)
    }
    func testGetWeekday_4() {
        let date = "2000-01-01".toDate()
        let weekday = date.getWeekday()

        XCTAssertEqual(weekday, .saturday)
    }
}

// MARK: - Start of Periods
extension DateTests {
    func testDayStart_1() {
        let date = "2023-04-29 11:11".toDate(format: "yyyy-MM-dd HH:mm")
        let dayStartDate = date.start(of: .day)

        let expectedResult = "2023-04-29 00:00".toDate(format: "yyyy-MM-dd HH:mm")
        XCTAssertEqual(dayStartDate, expectedResult)
    }
    func testDayStart_2() {
        let date = "2023-04-29 23:59".toDate(format: "yyyy-MM-dd HH:mm")
        let dayStartDate = date.start(of: .day)

        let expectedResult = "2023-04-29 00:00".toDate(format: "yyyy-MM-dd HH:mm")
        XCTAssertEqual(dayStartDate, expectedResult)
    }
    func testMonthStart_1() {
        let date = "2023-04-29".toDate()
        let monthStartDate = date.start(of: .month)

        let expectedResult = "2023-04-01".toDate()
        XCTAssertEqual(monthStartDate, expectedResult)
    }
    func testMonthStart_2() {
        let date = "2023-12-31".toDate()
        let monthStartDate = date.start(of: .month)

        let expectedResult = "2023-12-01".toDate()
        XCTAssertEqual(monthStartDate, expectedResult)
    }
    func testMonthStart_3() {
        let date = "2023-12-01".toDate()
        let monthStartDate = date.start(of: .month)

        let expectedResult = "2023-12-01".toDate()
        XCTAssertEqual(monthStartDate, expectedResult)
    }
    func testMonthStart_4() {
        let date = "2023-02-28".toDate()
        let monthStartDate = date.start(of: .month)

        let expectedResult = "2023-02-01".toDate()
        XCTAssertEqual(monthStartDate, expectedResult)
    }
    func testYearStart_1() {
        let date = "2023-12-31".toDate()
        let monthStartDate = date.start(of: .year)

        let expectedResult = "2023-01-01".toDate()
        XCTAssertEqual(monthStartDate, expectedResult)
    }
}

// MARK: - End Of Periods
extension DateTests {
    func testDayEnd_1() {
        let date = "2023-04-29".toDate()
        let dayStartDate = date.end(of: .day)

        let expectedResult = "2023-04-29 23:59:59".toDate(format: "yyyy-MM-dd HH:mm:ss")
        XCTAssertEqual(dayStartDate, expectedResult)
    }
    func testMonthEnd_1() {
        let date = "2023-04-29".toDate()
        let dayStartDate = date.end(of: .month)

        let expectedResult = "2023-04-30 23:59:59".toDate(format: "yyyy-MM-dd HH:mm:ss")
        XCTAssertEqual(dayStartDate, expectedResult)
    }
    func testYearEnd_1() {
        let date = "2023-04-29".toDate()
        let dayStartDate = date.end(of: .year)

        let expectedResult = "2023-12-31 23:59:59".toDate(format: "yyyy-MM-dd HH:mm:ss")
        XCTAssertEqual(dayStartDate, expectedResult)
    }
}
