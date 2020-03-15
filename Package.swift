// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "StringCaseConverter",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(name: "StringCaseConverter", targets: ["StringCaseConverter"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "StringCaseConverter", dependencies: []),
        .testTarget(name: "StringCaseConverterTests", dependencies: ["StringCaseConverter"])
    ]
)
