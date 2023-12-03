//
//  MDateFormatterTests.swift of CalendarView
//
//  Created by Alina Petrovska on 04.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import XCTest
@testable import MijickCalendarView

final class MDateFormatterTests: XCTestCase { }

// MARK: - Day Symbol
extension MDateFormatterTests {
    func testDaySymbols_englishLocale_Monday_fullFormat() {
        MCalendar.locale = .english
        let daySymbol = MDateFormatter.getString(for: .monday, format: .full)
        let expectedDaySymbol = "Monday"
        
        XCTAssertEqual(daySymbol, expectedDaySymbol)
    }
    func testDaySymbols_englishLocale_Sunday_shortFormat() {
        MCalendar.locale = .english
        let daySymbol = MDateFormatter.getString(for: .sunday, format: .short)
        let expectedDaySymbol = "Sun"
        
        XCTAssertEqual(daySymbol, expectedDaySymbol)
    }
    func testDaySymbols_englishLocale_Wednesday_veryShortFormat() {
        MCalendar.locale = .english
        let daySymbol = MDateFormatter.getString(for: .wednesday, format: .veryShort)
        let expectedDaySymbol = "W"
        
        XCTAssertEqual(daySymbol, expectedDaySymbol)
    }
    func testDaySymbols_polishLocale_Monday_fullFormat() {
        MCalendar.locale = .polish
        let daySymbol = MDateFormatter.getString(for: .monday, format: .full)
        let expectedDaySymbol = "Poniedziałek"
        
        XCTAssertEqual(daySymbol, expectedDaySymbol)
    }
    func testDaySymbols_polishLocale_Sunday_shortFormat() {
        MCalendar.locale = .polish
        let daySymbol = MDateFormatter.getString(for: .sunday, format: .short)
        let expectedDaySymbol = "Niedz."
        
        XCTAssertEqual(daySymbol, expectedDaySymbol)
    }
    func testDaySymbols_polishLocale_Wednesday_veryShortFormat() {
        MCalendar.locale = .polish
        let daySymbol = MDateFormatter.getString(for: .wednesday, format: .veryShort)
        let expectedDaySymbol = "Ś"
        
        XCTAssertEqual(daySymbol, expectedDaySymbol)
    }
}

// MARK: - Date Format
extension MDateFormatterTests {
    var includedWeekNameFormat: String { "E, d MMM yyyy" }
    var dashedFormat: String { "yyyy-MM-dd" }
    var dottedFormat: String { "dd.MM.yy" }
    var comparableDate: String { "2023-11-04" }
    
    func testDateFormat_englishLocale_dateWithShortWeekDateName() {
        MCalendar.locale = .english
        let formattedDate = MDateFormatter.getString(from: comparableDate.toDate(), format: includedWeekNameFormat)
        let expectedFormattedDate = "Sat, 4 Nov 2023"
        
        XCTAssertEqual(formattedDate, expectedFormattedDate)
    }
    func testDateFormat_polishLocale_dateWithShortWeekDateName() {
        MCalendar.locale = .polish
        let formattedDate = MDateFormatter.getString(from: comparableDate.toDate(), format: includedWeekNameFormat)
        let expectedFormattedDate = "Sob., 4 Lis 2023"
        
        XCTAssertEqual(formattedDate, expectedFormattedDate)
    }
    func testDateFormat_dateWithDashes() {
        MCalendar.locale = .english
        let formattedDate = MDateFormatter.getString(from: comparableDate.toDate(), format: dashedFormat)
        let expectedFormattedDate = "2023-11-04"
        
        XCTAssertEqual(formattedDate, expectedFormattedDate)
    }
    func testDateFormat_polishLocale_dateWithDots() {
        MCalendar.locale = .polish
        let formattedDate = MDateFormatter.getString(from: comparableDate.toDate(), format: dottedFormat)
        let expectedFormattedDate = "04.11.23"
        
        XCTAssertEqual(formattedDate, expectedFormattedDate)
    }
}
