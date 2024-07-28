// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SwiftUIRouter",
    platforms: [
        .macOS(.v11),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SwiftUIRouter",
            targets: ["SwiftUIRouter"]),
    ],
    targets: [
        .target(
            name: "SwiftUIRouter"),
        .testTarget(
            name: "SwiftUIRouterTests",
            dependencies: ["SwiftUIRouter"]),
    ]
)
