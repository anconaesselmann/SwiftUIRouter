// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SwiftUIRouter",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SwiftUIRouter",
            targets: ["SwiftUIRouter"]
        ),
    ],
    targets: [
        .target(name: "SwiftUIRouter")
    ]
)
