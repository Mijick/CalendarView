//
//  DataMonthViewTests.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import XCTest
@testable import MijickCalendarView

final class DataMonthViewTests: XCTestCase {
    func testGeneratedMonths_NumberOfItemsIsCorrect_1() {
        MCalendar.startDate = "2023-11-01".toDate()
        MCalendar.endDate = "2023-11-01".toDate()

        let items = [CalendarData].generate()
        XCTAssertEqual(items.count, 1)
    }
    func testGeneratedMonths_NumberOfItemsIsCorrect_2() {
        MCalendar.startDate = "2023-11-01".toDate()
        MCalendar.endDate = "2024-01-01".toDate()

        let items = [CalendarData].generate()
        XCTAssertEqual(items.count, 3)
    }
    func testGeneratedMonths_MonthForEachItemIsSetCorrectly() {
        MCalendar.startDate = "2023-11-01".toDate()
        MCalendar.endDate = "2024-01-01".toDate()

        let items = [CalendarData].generate().map(\.month)
        let expectedMonths = [
            "2023-11-01".toDate(),
            "2023-12-01".toDate(),
            "2024-01-01".toDate()
        ]

        XCTAssertEqual(items, expectedMonths)
    }
    func testGeneratedMonths_DaysAreCorrect() {
        MCalendar.firstWeekday = .monday
        MCalendar.startDate = "2023-11-01".toDate()
        MCalendar.endDate = "2023-11-01".toDate()

        let items = [CalendarData].generate().map(\.items).first!
        let expectedDays = [
            ["2023-10-30".toDate(), "2023-10-31".toDate(), "2023-11-01".toDate(), "2023-11-02".toDate(), "2023-11-03".toDate(), "2023-11-04".toDate(), "2023-11-05".toDate()],
            ["2023-11-06".toDate(), "2023-11-07".toDate(), "2023-11-08".toDate(), "2023-11-09".toDate(), "2023-11-10".toDate(), "2023-11-11".toDate(), "2023-11-12".toDate()],
            ["2023-11-13".toDate(), "2023-11-14".toDate(), "2023-11-15".toDate(), "2023-11-16".toDate(), "2023-11-17".toDate(), "2023-11-18".toDate(), "2023-11-19".toDate()],
            ["2023-11-20".toDate(), "2023-11-21".toDate(), "2023-11-22".toDate(), "2023-11-23".toDate(), "2023-11-24".toDate(), "2023-11-25".toDate(), "2023-11-26".toDate()],
            ["2023-11-27".toDate(), "2023-11-28".toDate(), "2023-11-29".toDate(), "2023-11-30".toDate(), "2023-12-01".toDate(), "2023-12-02".toDate(), "2023-12-03".toDate()]
        ]

        XCTAssertEqual(items, expectedDays)
    }
}


// MARK: - Typealias
fileprivate typealias CalendarData = MijickCalendarView.Data.MonthView
