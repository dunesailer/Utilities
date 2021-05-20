// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dunesailer Utilities",
    platforms: [
        .macOS(.v11), .iOS(.v14), .tvOS(.v14), .watchOS(.v7)
    ],
    products: [
        .library(
            name: "DunesailerUtilities",
            type: .static,
            targets: ["DunesailerUtilities"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "DunesailerUtilities",
            dependencies: []),
        .testTarget(
            name: "DunesailerUtilitiesTests",
            dependencies: ["DunesailerUtilities"]),
    ]
)
