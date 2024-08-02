// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Auth",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Auth",
            targets: ["Auth"]
        ),
    ],
    targets: [
        .target(name: "Auth")
    ]
)
