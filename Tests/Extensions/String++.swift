//
//  String++.swift of CalendarView
//
//  Created by Alina Petrovska on 04.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

extension String {
    func toDate(format: String? = nil) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format ?? "yyyy-MM-dd"
        return formatter.date(from: self) ?? .now
    }
}
