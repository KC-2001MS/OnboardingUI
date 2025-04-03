//
//  Onboarding.swift
//
//
//  Created by Keisuke Chinone on 2023/12/10.
//

import Foundation
import SwiftUI

///  A protocol that allows you to easily configure what is displayed in Onboarding
@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public protocol Onboarding: Identifiable, Sendable {
    var id: UUID { get }
    /// Onboarding Title
    var title: Text { get }
    /// Variables indicating features
    @FeatureBuilder var features: Array<Feature> { get }
    /// Link to be displayed at the bottom of the screen
    var link: Link<Text>? { get }
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public extension Onboarding {
    var id: UUID {
        return UUID()
    }
    
    var link: Link<Text>? {
        return nil
    }
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
    
    public init(title: Text,image: Image?,message: Text?) {
        self.id = UUID()
        self.title = title
        self.image = image
        self.message = message
    }
    
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
    
    /// Change the title variable from the original Feature structure.
    /// - Parameter string: String to be displayed
    /// - Returns: Feature structure with modified title variable
    public func title(_ string: String) -> Self {
        .init(title: Text(string), image: self.image, message: self.message)
    }
    
    /// Change the title variable from the original Feature structure.
    /// - Parameters:
    ///   - key: LocalizedStringKey to be displayed
    ///   - tableName: The name of the string table to search. If nil, use the table in the Localizable.strings file.
    ///   - bundle: The bundle containing the strings file. If nil, use the main bundle.
    ///   - comment: Contextual information about this key-value pair.
    /// - Returns: Feature structure with modified title variable
    public func title(
        _ key: LocalizedStringKey,
        tableName: String? = nil,
        bundle: Bundle? = nil,
        comment: StaticString? = nil
    ) -> Self {
        .init(title: Text(key, tableName: tableName, bundle: bundle, comment: comment), image: self.image, message: self.message)
    }
    
    /// Change the image variable from the original Feature structure.
    /// - Parameter systemName: The name of the system symbol image. Use the SF Symbols app to look up the names of system symbol images.
    /// - Returns: Feature structure with modified image variable
    public func image(systemName: String) -> Self {
        .init(title: self.title, image: Image(systemName: systemName), message: self.message)
    }
    
    /// Change the message variable from the original Feature structure.
    /// - Parameter string: String to be displayed
    /// - Returns: Feature structure with modified message variable
    public func message(_ string: String) -> Self {
        .init(title: self.title, image: self.image, message: Text(string))
    }
    
    /// Change the message variable from the original Feature structure.
    /// - Parameters:
    ///   - key: LocalizedStringKey to be displayed
    ///   - tableName: The name of the string table to search. If nil, use the table in the Localizable.strings file.
    ///   - bundle: The bundle containing the strings file. If nil, use the main bundle.
    ///   - comment: Contextual information about this key-value pair.
    /// - Returns: Feature structure with modified message variable
    public func message(
        _ key: LocalizedStringKey,
        tableName: String? = nil,
        bundle: Bundle? = nil,
        comment: StaticString? = nil
    ) -> Self {
        .init(title: self.title, image: self.image, message: Text(key, tableName: tableName, bundle: bundle, comment: comment))
    }
}
