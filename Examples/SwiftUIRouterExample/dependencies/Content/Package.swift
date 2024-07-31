// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Content",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Content",
            targets: ["Content"]),
    ],
    dependencies: [
        .package(path: "../../../../../SwiftUIRouter"),
        .package(path: "../Routes")
    ],
    targets: [
        .target(
            name: "Content",
            dependencies: ["SwiftUIRouter", "Routes"]
        )
    ]
)
