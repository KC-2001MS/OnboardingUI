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
    dependencies: [],
    targets: [
        .target(
            name: "OnboardingUI",
            dependencies: [],
            resources: [.process("OnboardingUI")]
        ),
        .testTarget(
            name: "OnboardingUITests",
            dependencies: ["OnboardingUI"]
        ),
    ]
)
