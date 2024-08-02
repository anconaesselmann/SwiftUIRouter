// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "LoggedOut",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "LoggedOut",
            targets: ["LoggedOut"]
        ),
    ],
    dependencies: [
        .package(path: "../../../../../SwiftUIRouter"),
        .package(path: "../Auth"),
        .package(path: "../SharedUI")
    ],
    targets: [
        .target(
            name: "LoggedOut",
            dependencies: ["SwiftUIRouter", "Auth", "SharedUI"]
        )
    ]
)
