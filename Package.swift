// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StrategicallyCodable",
    platforms: [
        .macOS(.v12), .iOS(.v15)
    ],
    products: [
        .library(
            name: "StrategicallyCodable",
            targets: ["StrategicallyCodable"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "StrategicallyCodable",
            dependencies: []),
        .testTarget(
            name: "StrategicallyCodableTests",
            dependencies: ["StrategicallyCodable"]),
    ]
)
