// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnboardingUI",
    defaultLocalization: LanguageTag(rawValue: "en"),
    platforms: [.iOS(.v17),.macOS(.v14),.macCatalyst(.v17),.visionOS(.v1),.tvOS(.v17)],
    products: [
        .library(
            name: "OnboardingUI",
            targets: ["OnboardingUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-testing.git", from: "0.10.0"),
    ],
    targets: [
        .target(
            name: "OnboardingUI",
            dependencies: []
        ),
        .testTarget(
            name: "OnboardingUITests",
            dependencies: [
                .product(name: "Testing", package: "swift-testing"),
                "OnboardingUI"
            ]
        ),
    ]
)
