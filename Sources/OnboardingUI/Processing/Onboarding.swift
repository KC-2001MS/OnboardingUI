//
//  Onboarding.swift
//
//
//  Created by Keisuke Chinone on 2023/12/10.
//


import Foundation
import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public protocol Onboarding: Identifiable, Sendable {
    var id: UUID { get }
    /// Onboarding Title
    var title: Text { get }
    /// Variables indicating features
    @FeatureBuilder var features: Array<Feature> { get }
}
/// Structures to build features to display onboarding
@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public struct Feature: Identifiable, Sendable {
    public var id: UUID = UUID()
    /// Onboarding Item Title
    public var title: Text = Text(verbatim: "")
    /// Onboarding Item Image
    public var image: Image? = nil
    /// Onboarding Item Message
    public var message: Text? = nil
    /// Default initializer
    public init() {
        self.id = UUID()
        self.title = Text(verbatim: "")
        self.image = nil
        self.message = nil
    }
    /// Initializer with LocalizedStringKey
    /// - Parameters:
    ///   - title: Title outlining the features
    ///   - imageName: Images showing features
    ///   - message: Description of features
    public init(_ title: LocalizedStringKey,imageName: String, message: LocalizedStringKey) {
        self.id = UUID()
        self.title = Text(title)
        self.image = Image(systemName: imageName)
        self.message = Text(message)
    }
    /// General initializer
    /// - Parameters:
    ///   - title: Title outlining the features
    ///   - imageName: Images showing features
    ///   - message: Description of features
    @_disfavoredOverload public init<S>(_ title: S,imageName: String, message: S) where S : StringProtocol {
        self.id = UUID()
        self.title = Text(title)
        self.image = Image(systemName: imageName)
        self.message = Text(message)
    }
}

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
