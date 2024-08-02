// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SharedUI",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SharedUI",
            targets: ["SharedUI"]
        ),
    ],
    targets: [
        .target(name: "SharedUI")
    ]
)
