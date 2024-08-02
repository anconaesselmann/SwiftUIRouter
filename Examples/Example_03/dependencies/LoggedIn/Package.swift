// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoggedIn",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "LoggedIn",
            targets: ["LoggedIn"]
        ),
    ],
    dependencies: [
        .package(path: "../../../../../SwiftUIRouter"),
        .package(path: "../Auth"),
        .package(path: "../SharedUI")
    ],
    targets: [
        .target(
            name: "LoggedIn",
            dependencies: ["SwiftUIRouter", "Auth", "SharedUI"]
        )
    ]
)
