//
//  Onboarding.swift
//
//
//  Created by Keisuke Chinone on 2023/12/10.
//

import Foundation
import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// A protocol that defines onboarding content for an app.
public protocol Onboarding: Identifiable, Sendable {
    /// The unique identifier for this onboarding item.
    var id: UUID { get }
    /// Onboarding Title
    var title: Text { get }
    /// Variables indicating features
    @FeatureBuilder var features: Array<Feature> { get }
    
    /// Optional link displayed on the onboarding screen.
    var link: Link<Text>? { get }
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public extension Onboarding {
    var id: UUID {
        return UUID()
    }
    // デフォルト実装でnilを返す
    var link: Link<Text>? {
        return nil
    }
}
/// Structures to build features to display onboarding
@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// A structure representing a single onboarding feature.
public struct Feature: Identifiable, Sendable {
    /// The unique identifier for this feature.
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
    
    /// Initializes a feature with title, image and message.
    /// - Parameters:
    ///   - title: The title text of the feature.
    ///   - image: The image representing the feature.
    ///   - message: The message text of the feature.
    public init(title: Text,image: Image?,message: Text?) {
        self.id = UUID()
        self.title = title
        self.image = image
        self.message = message
    }
    
    /// Initializes a feature using closures to create title, image and message.
    /// - Parameters:
    ///   - title: Closure returning the title text.
    ///   - image: Closure returning the image.
    ///   - message: Closure returning the message text.
    public init(title: () -> Text,image: () -> Image?,message: () -> Text?) {
        self.id = UUID()
        self.title = title()
        self.image = image()
        self.message = message()
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
    
    /// Initializes a feature with localized string resource message.
    /// - Parameters:
    ///   - title: Title outlining the features
    ///   - imageName: Images showing features
    ///   - message: Description of features as a localized resource
    public init(_ title: LocalizedStringKey,imageName: String, messageResource: LocalizedStringResource) {
        self.id = UUID()
        self.title = Text(title)
        self.image = Image(systemName: imageName)
        self.message = Text(messageResource)
    }
    /// Initializes a feature with localized string resource message.
    /// - Parameters:
    ///   - titleResource: Title outlining the features as a localized resource
    ///   - imageName: Images showing features
    ///   - messageResource: Description of features as a localized resource
    public init(titleResource: LocalizedStringResource,imageName: String, messageResource: LocalizedStringResource) {
        self.id = UUID()
        self.title = Text(titleResource)
        self.image = Image(systemName: imageName)
        self.message = Text(messageResource)
    }
    /// Initializes a feature with string titles and messages.
    /// - Parameters:
    ///   - title: String title of the feature.
    ///   - imageName: System image name.
    ///   - message: Description message string.
    @_disfavoredOverload
    public init<S>(_ title: S,imageName: String, message: S) where S : StringProtocol {
        self.id = UUID()
        self.title = Text(title)
        self.image = Image(systemName: imageName)
        self.message = Text(message)
    }
    
    /// Returns a new feature with the title replaced.
    /// - Parameter string: The new title string.
    /// - Returns: A new Feature instance with updated title.
    public func title(_ string: String) -> Self {
        .init(title: Text(string), image: self.image, message: self.message)
    }
    
    /// Returns a new feature with the localized title replaced.
    /// - Parameters:
    ///   - key: The localized string key for the new title.
    ///   - tableName: The table name for localization.
    ///   - bundle: The bundle containing the localized strings.
    ///   - comment: Contextual comment for translators.
    /// - Returns: A new Feature instance with updated title.
    public func title(
        _ key: LocalizedStringKey,
        tableName: String? = nil,
        bundle: Bundle? = nil,
        comment: StaticString? = nil
    ) -> Self {
        .init(title: Text(key, tableName: tableName, bundle: bundle, comment: comment), image: self.image, message: self.message)
    }
    
    /// Returns a new feature with the image replaced by a system image.
    /// - Parameter systemName: The system image name.
    /// - Returns: A new Feature instance with updated image.
    public func image(systemName: String) -> Self {
        .init(title: self.title, image: Image(systemName: systemName), message: self.message)
    }
    
    /// Returns a new feature with the message replaced.
    /// - Parameter string: The new message string.
    /// - Returns: A new Feature instance with updated message.
    public func message(_ string: String) -> Self {
        .init(title: self.title, image: self.image, message: Text(string))
    }
    
    /// Returns a new feature with the localized message replaced.
    /// - Parameters:
    ///   - key: The localized string key for the new message.
    ///   - tableName: The table name for localization.
    ///   - bundle: The bundle containing the localized strings.
    ///   - comment: Contextual comment for translators.
    /// - Returns: A new Feature instance with updated message.
    public func message(
        _ key: LocalizedStringKey,
        tableName: String? = nil,
        bundle: Bundle? = nil,
        comment: StaticString? = nil
    ) -> Self {
        .init(title: self.title, image: self.image, message: Text(key, tableName: tableName, bundle: bundle, comment: comment))
    }
}
/// Result builder that allows you to freely build Feature structures
@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// A result builder to construct onboarding features.
@resultBuilder
public struct FeatureBuilder {
    /// Required in resultBuilder
    /// Combines multiple Features into an array.
    /// - Parameter parts: A variadic list of Features.
    /// - Returns: An array of Features.
    public static func buildBlock(_ parts: Feature...) -> Array<Feature> {
        parts
    }
    /// Enable if
    /// Handles optional Feature arrays.
    /// - Parameter parts: An optional array of Features.
    /// - Returns: The first Feature or a default Feature.
    public static func buildOptional(_ parts: [Feature]?) -> Feature {
        parts?.first ?? Feature()
    }
    /// Enable if-else (first branch)
    /// - Parameter parts: An array of Features.
    /// - Returns: The first Feature or a default Feature.
    public static func buildEither(first parts: [Feature]) -> Feature {
        parts.first ?? Feature()
    }
    /// Enable if-else (second branch)
    /// - Parameter parts: An array of Features.
    /// - Returns: The first Feature or a default Feature.
    public static func buildEither(second parts: [Feature]) -> Feature {
        parts.first ?? Feature()
    }
    /// Enable for-in
    /// - Parameter parts: An array of Feature arrays.
    /// - Returns: The first Feature from the first array or a default Feature.
    public static func buildArray(_ parts: [[Feature]]) -> Feature {
        parts.first?.first ?? Feature()
    }
    /// Enable #if
    /// - Parameter parts: An array of Features.
    /// - Returns: The array of Features.
    public static func buildLimitedAvailability(_ parts: [Feature]) -> Array<Feature> {
        parts
    }
}

