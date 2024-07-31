// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Sidebar",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Sidebar",
            targets: ["Sidebar"]),
    ],
    dependencies: [
        .package(path: "../../../../../SwiftUIRouter"),
        .package(path: "../Routes"),
        .package(url: "https://github.com/anconaesselmann/SwiftUIMarkdownView", from: "0.1.3")
    ],
    targets: [
        .target(
            name: "Sidebar",
            dependencies: ["SwiftUIRouter", "Routes", "SwiftUIMarkdownView"]
        )
    ]
)
