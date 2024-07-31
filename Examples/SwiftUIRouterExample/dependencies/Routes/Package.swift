// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Routes",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Routes",
            targets: ["Routes"]),
    ],
    dependencies: [
        .package(path: "../../../../../SwiftUIRouter"),
    ],
    targets: [
        .target(
            name: "Routes",
            dependencies: ["SwiftUIRouter"]
        )
    ]
)
