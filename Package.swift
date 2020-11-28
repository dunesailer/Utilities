// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dunesailer Utilities",
    platforms: [
        .macOS(.v10_15), .iOS(.v13),
    ],
    products: [
        .library(
            name: "DunesailerUtilities",
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
