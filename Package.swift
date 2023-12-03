// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MijickCalendarView",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(name: "MijickCalendarView", targets: ["MijickCalendarView"])
    ],
    targets: [
        .target(name: "MijickCalendarView", dependencies: [], path: "Sources"),
        .testTarget(name: "MijickCalendarViewTests", dependencies: ["MijickCalendarView"], path: "Tests")
    ]
)
