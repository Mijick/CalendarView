//
//  RoundedRectangle.swift of CalendarView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct RoundedRectangle: Shape {
    var radius: CGFloat = .infinity
    var corners: Corner


    func path(in rect: CGRect) -> Path {
        let points = createPoints(rect)
        let path = createPath(rect, points)
        return path
    }
}
private extension RoundedRectangle {
    func createPoints(_ rect: CGRect) -> [CGPoint] {[
        .init(x: rect.minX, y: corners.contains(.topLeft) ? rect.minY + getRadius(rect)  : rect.minY),
        .init(x: corners.contains(.topLeft) ? rect.minX + getRadius(rect) : rect.minX, y: rect.minY ),
        .init(x: corners.contains(.topRight) ? rect.maxX - getRadius(rect) : rect.maxX, y: rect.minY ),
        .init(x: rect.maxX, y: corners.contains(.topRight) ? rect.minY + getRadius(rect)  : rect.minY ),
        .init(x: rect.maxX, y: corners.contains(.bottomRight) ? rect.maxY - getRadius(rect) : rect.maxY ),
        .init(x: corners.contains(.bottomRight) ? rect.maxX - getRadius(rect) : rect.maxX, y: rect.maxY ),
        .init(x: corners.contains(.bottomLeft) ? rect.minX + getRadius(rect) : rect.minX, y: rect.maxY ),
        .init(x: rect.minX, y: corners.contains(.bottomLeft) ? rect.maxY - getRadius(rect) : rect.maxY )
    ]}
    func createPath(_ rect: CGRect, _ points: [CGPoint]) -> Path {
        var path = Path()

        path.move(to: points[0])
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.minY), tangent2End: points[1], radius: getRadius(rect))
        path.addLine(to: points[2])
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.minY), tangent2End: points[3], radius: getRadius(rect))
        path.addLine(to: points[4])
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.maxY), tangent2End: points[5], radius: getRadius(rect))
        path.addLine(to: points[6])
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.maxY), tangent2End: points[7], radius: getRadius(rect))
        path.closeSubpath()

        return path
    }
}
private extension RoundedRectangle {
    func getRadius(_ rect: CGRect) -> CGFloat { min(radius, min(rect.height, rect.width) / 2) }
}


// MARK: - Corner
extension RoundedRectangle { struct Corner: OptionSet { let rawValue: Int } }
extension RoundedRectangle.Corner {
    static let topLeft: Self = .init(rawValue: 1 << 0)
    static let topRight: Self = .init(rawValue: 1 << 1)
    static let bottomRight: Self = .init(rawValue: 1 << 2)
    static let bottomLeft: Self = .init(rawValue: 1 << 3)
    static let allCorners: Self = [.topLeft, topRight, .bottomLeft, .bottomRight]
}
