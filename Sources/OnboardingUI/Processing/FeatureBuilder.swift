//
//  FeatureBuilder.swift
//  OnboardingUI
//
//  Created by 茅根啓介 on 2025/04/03.
//

import Foundation

/// Result builder that allows you to freely build Feature structures
@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@resultBuilder
public struct FeatureBuilder {
    /// Required in resultBuilder
    public static func buildBlock(_ parts: Feature...) -> Array<Feature> {
        parts
    }
    /// Enable if
    public static func buildOptional(_ parts: [Feature]?) -> Feature {
        parts?.first ?? Feature()
    }
    /// Enable if-else
    public static func buildEither(first parts: [Feature]) -> Feature {
        parts.first ?? Feature()
    }
    /// Enable if-else
    public static func buildEither(second parts: [Feature]) -> Feature {
        parts.first ?? Feature()
    }
    /// Enable for-in
    public static func buildArray(_ parts: [[Feature]]) -> Feature {
        parts.first?.first ?? Feature()
    }
    /// Enable #if
    public static func buildLimitedAvailability(_ parts: [Feature]) -> Array<Feature> {
        parts
    }
}
