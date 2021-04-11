// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(watchOS)
let targets: [PackageDescription.Target] = [
    .target(
        name: "DunesailerUtilities",
        dependencies: []),
]
#else
let targets: [PackageDescription.Target] = [
    .target(
        name: "DunesailerUtilities",
        dependencies: []),
    .testTarget(
        name: "DunesailerUtilitiesTests",
        dependencies: ["DunesailerUtilities"]),]
#endif

let package = Package(
    name: "Dunesailer Utilities",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(
            name: "DunesailerUtilities",
            targets: ["DunesailerUtilities"]),
    ],
    dependencies: [
    ],
    targets: targets
)
