//
//  OnboardingItem.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

/// A view representing an onboarding item.
///
/// Use `OnboardingItem` to create individual onboarding items with an image and accompanying content.
///
/// Example:
/// ```swift
/// let onboardingItem = OnboardingItem(systemName: "star", content: {
///     Text("Welcome to the app!")
/// })
/// ```
///
/// - Parameters:
///   - Content: The type of the content view.
///   - S: The type of the shape style.
@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public struct OnboardingItem<Content: View,S: ShapeStyle>: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    /// The content view of the onboarding item.
    var content: Content
    /// The image to be displayed in the onboarding item.
    var image: Image
    /// The rendering mode for the symbol in the onboarding item.
    var mode: SymbolRenderingMode?
    /// An array of shape styles to be applied to the onboarding item.
    var shape: Array<S> = []
    /// The size options for the shape in the onboarding item.
    private var shapeSize: ShapeSize
    /// Options for the size of the shape in the onboarding item.
    private enum ShapeSize {
        case none
        case primary
        case secondary
        case tertiary
    }
    
    private var iconEdge: EdgeInsets {
#if os(visionOS)
        EdgeInsets(
            top: CGFloat(10),
            leading: CGFloat(0),
            bottom: CGFloat(10),
            trailing: CGFloat(18.75)
        )
#elseif os(tvOS)
        EdgeInsets(
            top: CGFloat(10),
            leading: CGFloat(0),
            bottom: CGFloat(10),
            trailing: CGFloat(50)
        )
#else
        EdgeInsets(
            top: CGFloat(10),
            leading: CGFloat(8.75),
            bottom: CGFloat(10),
            trailing: CGFloat(8.75)
        )
#endif
    }
    /// Creates an onboarding item with a custom image and content.
    ///
    /// - Parameters:
    ///   - image: A closure that returns the custom image for the onboarding item.
    ///   - content: A closure that returns the content view for the onboarding item.
    public init(
        _ image: () -> Image,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = image()
        self.mode = .monochrome
        self.shape = []
        self.shapeSize = .none
    }
    /// Creates an onboarding item with a custom image, shape, and content.
    ///
    /// - Parameters:
    ///   - image: A closure that returns the custom image for the onboarding item.
    ///   - shape: The shape style to apply to the onboarding item.
    ///   - content: A closure that returns the content view for the onboarding item.
    public init(
        _ image: () -> Image,
        shape: S = Color.accentColor,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = image()
        self.mode = .monochrome
        self.shape = [shape]
        self.shapeSize = .primary
    }
    /// Creates an onboarding item with a custom image, mode, primary and secondary shapes, and content.
    ///
    /// - Parameters:
    ///   - image: A closure that returns the custom image for the onboarding item.
    ///   - mode: The rendering mode for the symbol in the onboarding item.
    ///   - primary: The primary shape style to apply to the onboarding item.
    ///   - secondary: The secondary shape style to apply to the onboarding item.
    ///   - content: A closure that returns the content view for the onboarding item.
    public init(
        image: () -> Image,
        mode: SymbolRenderingMode? = .palette,
        primary: S = Color.accentColor,
        secondary: S = Color.accentColor,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = image()
        self.mode = mode
        self.shape = [primary, secondary]
        self.shapeSize = .secondary
    }
    /// Creates an onboarding item with a custom image, mode, primary, secondary, and tertiary shapes, and content.
    ///
    /// - Parameters:
    ///   - image: A closure that returns the custom image for the onboarding item.
    ///   - mode: The rendering mode for the symbol in the onboarding item.
    ///   - primary: The primary shape style to apply to the onboarding item.
    ///   - secondary: The secondary shape style to apply to the onboarding item.
    ///   - tertiary: The tertiary shape style to apply to the onboarding item.
    ///   - content: A closure that returns the content view for the onboarding item.
    public init(
        image: () -> Image,
        mode: SymbolRenderingMode? = .palette,
        primary: S = Color.accentColor,
        tertiary: S = Color.accentColor,
        secondary: S = Color.accentColor,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = image()
        self.mode = mode
        self.shape = [primary, secondary, tertiary]
        self.shapeSize = .tertiary
    }
    /// Creates an onboarding item with a system image, mode, and content.
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol image.
    ///   - mode: The rendering mode for the symbol in the onboarding item.
    ///   - content: A closure that returns the content view for the onboarding item.
    public init(
        systemName: String,
        mode: SymbolRenderingMode? = .monochrome,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = Image(systemName: systemName)
        self.mode = mode
        self.shape = []
        self.shapeSize = .none
    }
    /// Creates an onboarding item with a system image, mode, primary shape, and content.
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol image.
    ///   - mode: The rendering mode for the symbol in the onboarding item.
    ///   - shape: The primary shape style to apply to the onboarding item.
    ///   - content: A closure that returns the content view for the onboarding item.
    public init(
        systemName: String,
        mode: SymbolRenderingMode? = .monochrome,
        shape: S = Color.accentColor,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = Image(systemName: systemName)
        self.mode = mode
        self.shape = [shape]
        self.shapeSize = .primary
    }
    /// Creates an onboarding item with a system image, mode, primary shape, and content.
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol image.
    ///   - mode: The rendering mode for the symbol in the onboarding item.
    ///   - primary: The primary shape style to apply to the onboarding item.
    ///   - secondary: The secondary shape style to apply to the onboarding item.
    ///   - content: A closure that returns the content view for the onboarding item.
    public init(
        systemName: String,
        mode: SymbolRenderingMode? = .palette,
        primary: S = Color.accentColor,
        secondary: S = Color.accentColor,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = Image(systemName: systemName)
        self.mode = mode
        self.shape = [primary, secondary]
        self.shapeSize = .secondary
    }
    /// Creates an onboarding item with a system image, mode, primary shape, and content.
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol image.
    ///   - mode: The rendering mode for the symbol in the onboarding item.
    ///   - primary: The primary shape style to apply to the onboarding item.
    ///   - secondary: The secondary shape style to apply to the onboarding item.
    ///   - tertiary: The tertiary shape style to apply to the onboarding item.
    ///   - content: A closure that returns the content view for the onboarding item.
    public init(
        systemName: String,
        mode: SymbolRenderingMode? = .palette,
        primary: S = Color.accentColor,
        secondary: S = Color.accentColor,
        tertiary: S = Color.accentColor,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = Image(systemName: systemName)
        self.mode = mode
        self.shape = [primary, secondary, tertiary]
        self.shapeSize = .tertiary
    }
    /// The content and layout of the onboarding item.
    public var body: some View {
        Group {
            if dynamicTypeSize <= .xxxLarge {
                HStack(spacing: 5) {
                    imageView
                    
                    VStack(alignment: .leading, spacing: 2.5) {
                        content
                    }
                }
            } else {
                VStack(alignment: .leading) {
                    imageView
                    
                    VStack(alignment: .leading, spacing: 5) {
                        content
                    }
                }
            }
        }
#if !os(macOS) || !os(tvOS)
        .padding(.horizontal, 40)
#endif
#if os(tvOS)
        .frame(maxWidth: .infinity,alignment: .leading)
#endif
    }
    
    @ViewBuilder
    private var imageView: some View {
        switch shapeSize {
        case .none:
            image
                .resizable()
                .scaledToFit()
#if !os(tvOS)
                .font(.largeTitle)
                .frame(width: 37.5, height: 37.5)
#else
                .font(.system(size: 80))
                .frame(width: 100, height: 100)
#endif
                .padding(iconEdge)
                .accessibilityHidden(true)
                .symbolRenderingMode(mode)
                .foregroundStyle(Color.accentColor)
#if os(visionOS)
                .brightness(0.5)
                .opacity(0.3)
#endif
        case .primary:
            image
                .resizable()
                .scaledToFit()
#if !os(tvOS)
                .font(.largeTitle)
                .frame(width: 37.5, height: 37.5)
#else
                .font(.system(size: 80))
                .frame(width: 100, height: 100)
#endif
                .padding(iconEdge)
                .accessibilityHidden(true)
                .symbolRenderingMode(mode)
                .foregroundStyle(shape[0])
#if os(visionOS)
                .brightness(0.75)
                .opacity(0.3)
#endif
        case .secondary:
            image
                .resizable()
                .scaledToFit()
#if !os(tvOS)
                .font(.largeTitle)
                .frame(width: 37.5, height: 37.5)
#else
                .font(.system(size: 80))
                .frame(width: 100, height: 100)
#endif
                .padding(iconEdge)
                .accessibilityHidden(true)
                .symbolRenderingMode(mode)
                .foregroundStyle(shape[0],shape[1])
#if os(visionOS)
                .brightness(0.75)
                .opacity(0.3)
#endif
        case .tertiary:
            image
                .resizable()
                .scaledToFit()
#if !os(tvOS)
                .font(.largeTitle)
                .frame(width: 37.5, height: 37.5)
#else
                .font(.system(size: 80))
                .frame(width: 100, height: 100)
#endif
                .padding(iconEdge)
                .accessibilityHidden(true)
                .symbolRenderingMode(mode)
                .foregroundStyle(shape[0],shape[1],shape[2])
#if os(visionOS)
                .brightness(0.75)
                .opacity(0.3)
#endif
        }
    }
}

#Preview("Onboarding Item") {
    ScrollView {
        OnboardingItem(systemName: "doc",mode: .palette,primary: .red,secondary: .blue) {
            Text(String("Sample Subtitle \(1)"))
                .onboardingTextFormatting(style: .subtitle)
            Text(String("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview."))
                .onboardingTextFormatting(style: .content)
        }
        
        OnboardingItem(systemName: "doc.fill",shape: .red) {
            Text(String("Sample Subtitle \(2)"))
                .onboardingTextFormatting(style: .subtitle)
            Text(String("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview."))
                .onboardingTextFormatting(style: .content)
        }
        
        OnboardingItem(systemName: "arrow.down.doc") {
            Text(String("Sample Subtitle \(3)"))
                .onboardingTextFormatting(style: .subtitle)
            Text(String("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview."))
                .onboardingTextFormatting(style: .content)
        }
        
        OnboardingItem {
            Image(systemName: "arrow.up.doc")
        } content: {
            Text(String("Sample Subtitle \(4)"))
                .onboardingTextFormatting(style: .subtitle)
            Text(String("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview."))
                .onboardingTextFormatting(style: .content)
        }
    }
}
