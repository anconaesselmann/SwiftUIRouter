// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Onboarding",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Onboarding",
            targets: ["Onboarding"]
        ),
    ],
    dependencies: [
        .package(path: "../../../../../SwiftUIRouter"),
        .package(path: "../Auth"),
        .package(path: "../SharedUI")
    ],
    targets: [
        .target(
            name: "Onboarding",
            dependencies: ["SwiftUIRouter", "Auth", "SharedUI"]
        )
    ]
)
