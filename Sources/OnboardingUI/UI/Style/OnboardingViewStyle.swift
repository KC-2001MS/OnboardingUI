//
//  OnboardingViewStyle.swift
//  OnboardingUI
//
//  Created by 茅根 啓介 on 2025/07/04.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
@preconcurrency public protocol OnboardingViewStyle {
    typealias Configuration = OnboardingViewStyleConfiguration

    associatedtype Body: View

    @preconcurrency @ViewBuilder func makeBody(configuration: Configuration) -> Body
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
struct AnyOnboardingViewStyle: OnboardingViewStyle {
    private var _makeBody: (Configuration) -> AnyView
    
    init<S: OnboardingViewStyle>(_ style: S) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
public struct OnboardingViewStyleConfiguration: Sendable {
    
    var dynamicTypeSize: DynamicTypeSize

    var title: Title
    
    var content: Content
    
    var footer: Footer
    
    var dismissLabel: DismissLabel
    
    init(
        dynamicTypeSize: DynamicTypeSize,
        title: Title,
        content: Content,
        footer: Footer ,
        dismissLabel: DismissLabel
    ) {
        self.dynamicTypeSize = dynamicTypeSize
        self.title = title
        self.content = content
        self.footer = footer
        self.dismissLabel = dismissLabel
    }
    
    struct Title: View, Sendable {
        var text: Text
        
        init(_ title: Text) {
            self.text = title
        }
        
        var body: some View {
            text
        }
    }

    @preconcurrency
    public struct Content: View, Sendable {
        private let items: [Feature]
        
        @Environment(\.dynamicTypeSize) private var dynamicTypeSize

        public init(_ items: [Feature]) {
            self.items = items
        }
        
        public var body: some View {
            ForEach(items) { feature in
                if let image = feature.image {
                    Group {
                        if dynamicTypeSize <= .xxxLarge {
                            HStack(alignment: .top,spacing: 20) {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .font(.largeTitle)
                                    .foregroundStyle(Color.accentColor)
                                    .frame(width: 37.5, height: 37.5)
                                    .accessibilityHidden(true)
                                
                                VStack(alignment: .leading, spacing: 2.5) {
                                    if let message = feature.message {
                                        feature.title
                                            .onboardingTextFormatting(style: .subtitle)
                                        message
                                            .onboardingTextFormatting(style: .content)
                                    }
                                }
                            }
                        } else {
                            VStack(alignment: .leading) {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .font(.largeTitle)
                                    .foregroundStyle(Color.accentColor)
                                    .frame(width: 37.5, height: 37.5)
                                    .accessibilityHidden(true)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    if let message = feature.message {
                                        feature.title
                                            .onboardingTextFormatting(style: .subtitle)
                                        message
                                            .onboardingTextFormatting(style: .content)
                                    }
                                }
                            }
                        }
                    }
#if os(tvOS)
                    .focusable()
#endif
                }
            }
        }

        /// 必ず明示的にクロージャで描画する
        public func callAsFunction<Content: View>(
            @ViewBuilder _ content: @escaping (Feature) -> Content
        ) -> some View {
            ForEach(items) { item in
                content(item)
            }
        }
    }
    
    @preconcurrency
    public struct Footer: View, Sendable {
        var content: AnyView
        
        init<V: View>(@ViewBuilder content: () -> V) {
            self.content = AnyView(content())
        }
        
        public var body: some View {
            content
        }
    }
    
    @preconcurrency public struct DismissLabel: View, Sendable {
        @Environment(\.dismiss) var dismiss
        
        var text: Text
        
        public init(text: Text) {
            self.text = text
        }
        
        public var body: some View {
            text
        }
    }
}

