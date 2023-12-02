//
//  Color++.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Color {
    static let backgroundPrimary: Color = {
        #if os(macOS)
        Color(NSColor.windowBackgroundColor)
        #else
        Color(UIColor.systemBackground)
        #endif
    }()
    static let backgroundSecondary: Color = {
        #if os(macOS)
        Color(NSColor.underPageBackgroundColor)
        #else
        Color(UIColor.secondarySystemBackground)
        #endif
    }()

    static let onBackgroundPrimary: Color = {
        #if os(macOS)
        Color(NSColor.windowBackgroundColor)
        #else
        Color(UIColor.label)
        #endif
    }()
    static let onBackgroundSecondary: Color = {
        #if os(macOS)
        Color(NSColor.windowBackgroundColor)
        #else
        Color(UIColor.secondaryLabel)
        #endif
    }()
}
