//
//  MDateRangeTests.swift of CalendarView
//
//  Created by Alina Petrovska on 04.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import XCTest
@testable import MijickCalendarView

final class MDateRangeTests: XCTestCase {
    var mDateRange = MDateRange()
}

// MARK: Test Add To Range
extension MDateRangeTests {
    func testAddToRange_upperDateLessThanLowerDate() {
        mDateRange.addToRange(.now)
        mDateRange.addToRange(.dayBeforeYesterday)
        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date> = (.dayBeforeYesterday ... .now)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_upperDateEqualToLowerDate() {
        mDateRange.addToRange(.now)
        mDateRange.addToRange(.now)
        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date> = (.now ... .now)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_upperDateIsNil() {
        mDateRange.addToRange(.now)
        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date>? = nil
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_checkRangeData() {
        mDateRange.addToRange(.now)
        mDateRange.addToRange(.tomorrow)
        
        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date>? = (.now ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsInRange() {
        mDateRange.addToRange(.now)
        mDateRange.addToRange(.dayAfterTomorrow)
        mDateRange.addToRange(.tomorrow)

        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date>? = (.tomorrow ... .dayAfterTomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsLessThanLowerDate() {
        mDateRange.addToRange(.now)
        mDateRange.addToRange(.tomorrow)
        mDateRange.addToRange(.yesterday)
        
        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date>? = (.yesterday ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsMoreThanUpperDate() {
        mDateRange.addToRange(.now)
        mDateRange.addToRange(.tomorrow)
        mDateRange.addToRange(.dayAfterTomorrow)
        
        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date>? = (.now ... .dayAfterTomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsEqualToLowerDate() {
        mDateRange.addToRange(.now)
        mDateRange.addToRange(.tomorrow)
        mDateRange.addToRange(.now)
        
        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date>? = (.now ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsEqualToUpperDate() {
        mDateRange.addToRange(.now)
        mDateRange.addToRange(.tomorrow)
        mDateRange.addToRange(.tomorrow)

        let range = mDateRange.getRange()
        let expectedRange: ClosedRange<Date>? = (.tomorrow ... .tomorrow)

        XCTAssertEqual(range, expectedRange)
    }
}

// MARK: Test is Contains function
extension MDateRangeTests {
    func testIsContainsDate_rangeIsNil() {
        let result = mDateRange.contains(.now)
        let expectedResult = false
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateInRange() {
        mDateRange.addToRange(.yesterday)
        mDateRange.addToRange(.tomorrow)
        
        let result = mDateRange.contains(.now)
        let expectedResult = true
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateLessThanLowerDate() {
        mDateRange.addToRange(.yesterday)
        mDateRange.addToRange(.tomorrow)
        
        let result = mDateRange.contains(.dayBeforeYesterday)
        let expectedResult = false
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateMoreThanUpperDate() {
        mDateRange.addToRange(.yesterday)
        mDateRange.addToRange(.tomorrow)
        
        let result = mDateRange.contains(.dayAfterTomorrow)
        let expectedResult = false
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateEqualToLowerDate() {
        mDateRange.addToRange(.yesterday)
        mDateRange.addToRange(.tomorrow)
        
        let result = mDateRange.contains(.yesterday)
        let expectedResult = true
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateEqualToUpperDate() {
        mDateRange.addToRange(.yesterday)
        mDateRange.addToRange(.tomorrow)
        
        let result = mDateRange.contains(.tomorrow)
        let expectedResult = true
        
        XCTAssertEqual(result, expectedResult)
    }
}
