// swift-tools-version: 6.0
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
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.4.0"),
    ],
    targets: [
        .target(
            name: "OnboardingUI",
            resources: [
//                .process("Media.xcassets"),
                .process("Localizable.xcstrings")
            ]
        ),
        .testTarget(
            name: "OnboardingUITests",
            dependencies: ["OnboardingUI"]
        ),
    ]
)
