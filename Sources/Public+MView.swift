//
//  Public+MView.swift of CalendarView
//
//  Created by Alina Petrovska on 13.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

public protocol MView: View {
    associatedtype V: View
    
    var body: V { get }
    func createContent() -> V
}

public extension MView {
    var body: V { createContent() }
}
