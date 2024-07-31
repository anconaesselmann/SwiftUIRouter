// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Detail",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Detail",
            targets: ["Detail"]),
    ],
    dependencies: [
        .package(path: "../../../../../SwiftUIRouter"),
        .package(path: "../Routes")
    ],
    targets: [
        .target(
            name: "Detail",
            dependencies: ["SwiftUIRouter", "Routes"]
        )
    ]
)
