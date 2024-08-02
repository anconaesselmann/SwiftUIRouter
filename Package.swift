// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SwiftUIRouter",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
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
