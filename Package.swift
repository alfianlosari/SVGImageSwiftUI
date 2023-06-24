// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SVGImageSwiftUI",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SVGImageSwiftUI",
            targets: ["SVGImageSwiftUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/alfianlosari/SVGKit", branch: "3.x")
    ],
    targets: [
        .target(
            name: "SVGImageSwiftUI",
            dependencies: [
                .product(name: "SVGKit", package: "SVGKit"),
                .product(name: "SVGKitSwift", package: "SVGKit")
            ]
        )
    ]
)