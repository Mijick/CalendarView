//
//  String++.swift of MijickCalendarView
//
//  Created by Alina Petrovska on 01.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import Foundation

extension String {
    func firstUppercased() -> String { prefix(1).uppercased() + dropFirst() }
}
