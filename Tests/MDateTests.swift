//
//  MDateTests.swift
//
//  Created by Alina Petrovska on 04.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import XCTest
@testable import MijickCalendarView


final class MDateTests: XCTestCase { 
    var mDate = MDate()
}

extension MDateTests {
    override func tearDown() { mDate = .init() }
}

// MARK: Test Get Date
extension MDateTests {
    func testGetDate_lowerDateIsNil() {
        let date = mDate.getDate()
        let expectedDate: Date? = nil
        
        XCTAssertEqual(date, expectedDate)
    }
    func testGetDate_upperDateIsNil() {
        mDate.update(.now)
        let date = mDate.getDate()
        let expectedDate = Date.now
        
        XCTAssertEqual(date, expectedDate)
    }
    func testGetDate_rangeHasAValue() {
        mDate.update(.now)
        mDate.addToRange(.tomorrow)
    
        let date = mDate.getDate()
        let expectedDate: Date? = nil
        
        XCTAssertEqual(date, expectedDate)
    }
}

// MARK: Test Date update
extension MDateTests {
    func testDateUpdate_upperDateIsNil() {
        mDate.update(.now)
        let date = mDate.getDate()
        let expectedDate = Date.now
        
        XCTAssertEqual(date, expectedDate)
    }
    func testDateUpdate_upperDateHasAValue() {
        mDate.update(.now)
        mDate.addToRange(.tomorrow)
        mDate.update(.beforeYesterday)
        
        let date = mDate.getDate()
        let expectedDate: Date? = nil
        
        XCTAssertEqual(date, expectedDate)
    }
}

// MARK: Test Add To Range
extension MDateTests {
    func testAddToRange_upperDateIsNil() {
        mDate.update(.now)
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = nil
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_checkRangeData() {
        mDate.addToRange(.now)
        mDate.addToRange(.tomorrow)
        
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = (.now ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsInRange() {
        mDate.addToRange(.now)
        mDate.addToRange(.afterTomorrow)
        mDate.addToRange(.tomorrow)
        
        let range = mDate.getRange()
        let expectedRange: ClosedRange<Date>? = (.now ... .afterTomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsLessThanLowerDate() {
        mDate.addToRange(.now)
        mDate.addToRange(.tomorrow)
        mDate.addToRange(.yesterday)
        
        let range = mDate.getRange()
        let expectedRange: ClosedRange<Date>? = (.yesterday ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsMoreThanUpperDate() {
        mDate.addToRange(.now)
        mDate.addToRange(.tomorrow)
        mDate.addToRange(.afterTomorrow)
        
        let range = mDate.getRange()
        let expectedRange: ClosedRange<Date>? = (.now ... .afterTomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsEqualToLowerDate() {
        mDate.addToRange(.now)
        mDate.addToRange(.tomorrow)
        mDate.addToRange(.now)
        
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = (.now ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testAddToRange_dateIsEqualToUpperDate() {
        mDate.addToRange(.now)
        mDate.addToRange(.tomorrow)
        mDate.addToRange(.tomorrow)
        
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = (.now ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
}


// MARK: Test Remove Date
extension MDateTests {
    func testRemoveDate_dateIsInRange() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        mDate.remove(.now)
        
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = (.yesterday ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testRemoveDate_dateIsLessThanLowerDate() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        mDate.remove(.beforeYesterday)
        
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = (.yesterday ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testRemoveDate_dateIsMoreThanUpperDate() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        mDate.remove(.afterTomorrow)
        
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = (.yesterday ... .tomorrow)
        
        XCTAssertEqual(range, expectedRange)
    }
    func testRemoveDate_dateIsEqualToLowerDate() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        mDate.remove(.yesterday)
        
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = nil
        
        XCTAssertEqual(range, expectedRange)
    }
    func testRemoveDate_dateIsEqualToUpperDate() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        mDate.remove(.tomorrow)
        
        let range = mDate.getRange()
        let expectedRange:  ClosedRange<Date>? = nil
        
        XCTAssertEqual(range, expectedRange)
    }
}

// MARK: Test is Contains function
extension MDateTests {
    func testIsContainsDate_rangeIsNil() {
        let result = mDate.contains(.now)
        let expectedResult = false
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateInRange() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        
        let result = mDate.contains(.now)
        let expectedResult = true
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateLessThanLowerDate() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        
        let result = mDate.contains(.beforeYesterday)
        let expectedResult = false
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateMoreThanUpperDate() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        
        let result = mDate.contains(.afterTomorrow)
        let expectedResult = false
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateEqualToLowerDate() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        
        let result = mDate.contains(.yesterday)
        let expectedResult = true
        
        XCTAssertEqual(result, expectedResult)
    }
    func testIsContainsDate_dateEqualToUpperDate() {
        mDate.addToRange(.yesterday)
        mDate.addToRange(.tomorrow)
        
        let result = mDate.contains(.tomorrow)
        let expectedResult = true
        
        XCTAssertEqual(result, expectedResult)
    }
}
