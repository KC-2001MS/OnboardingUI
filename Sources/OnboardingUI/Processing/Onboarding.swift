//
//  Onboarding.swift
//
//
//  Created by Keisuke Chinone on 2023/12/10.
//


import Foundation
import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public protocol Onboarding: Identifiable, Sendable {
    var id: UUID { get }
    
    var title: Text { get }

    @FeatureBuilder var features: Array<Feature> { get }
}

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct Feature: Identifiable, Sendable {
    public var id: UUID = UUID()
    
    public var title: Text = Text(verbatim: "")
    
    public var image: Image? = nil
    
    public var message: Text? = nil
    
    public init() {
        self.id = UUID()
        self.title = Text(verbatim: "")
        self.image = nil
        self.message = nil
    }
    
    public init(_ title: LocalizedStringKey,imageName: String, message: LocalizedStringKey) {
        self.id = UUID()
        self.title = Text(title)
        self.image = Image(systemName: imageName)
        self.message = Text(message)
    }
    
    public init<S>(_ title: S,imageName: String, message: S) where S : StringProtocol {
        self.id = UUID()
        self.title = Text(title)
        self.image = Image(systemName: imageName)
        self.message = Text(message)
    }
    
    public mutating func featureTitle(_ title: LocalizedStringKey) -> Self {
        self.title = Text(title)
        return self
    }
}

@resultBuilder
public struct FeatureBuilder {
    public static func buildBlock(_ parts: Feature...) -> Array<Feature> {
        parts
    }
    
    public static func buildOptional(_ parts: [Feature]?) -> Feature {
        parts?.first ?? Feature()
    }
    // if-elseが使えるようになる
    public static func buildEither(first parts: [Feature]) -> Feature {
        parts.first ?? Feature()
    }
    
    // if-elseが使えるようになる
    public static func buildEither(second parts: [Feature]) -> Feature {
        parts.first ?? Feature()
    }
    
    // for-inが使えるようになる
    public static func buildArray(_ parts: [[Feature]]) -> Feature {
        parts.first?.first ?? Feature()
    }
    
    // #if (ビルドターゲット指定での条件分岐)が使えるようになる
    public static func buildLimitedAvailability(_ parts: [Feature]) -> Array<Feature> {
        parts
    }
}
