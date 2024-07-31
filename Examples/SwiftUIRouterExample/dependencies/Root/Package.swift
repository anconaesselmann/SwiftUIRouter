// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Root",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Root",
            targets: ["Root"]),
    ],
    dependencies: [
        .package(path: "../../../../../SwiftUIRouter"),
        .package(path: "../Routes"),
        .package(path: "../Content"),
        .package(path: "../Sidebar"),
        .package(path: "../Detail")
    ],
    targets: [
        .target(
            name: "Root",
            dependencies: ["SwiftUIRouter", "Routes", "Content", "Sidebar", "Detail"]
        )
    ]
)
