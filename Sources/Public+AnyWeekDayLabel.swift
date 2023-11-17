//
//  Public+AnyWeekDayLabel.swift of CalendarView
//
//  Created by Alina Petrovska on 17.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

public struct AnyWeekDayLabel: View {
    private let internalView: AnyView
    
    init<V: WeekDayLabel>(_ view: V) { internalView = view.erased() }
    public var body: some View { internalView }
}
