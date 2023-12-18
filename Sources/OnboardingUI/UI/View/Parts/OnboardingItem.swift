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
        HStack(spacing: 10) {
            switch shapeSize {
            case .none:
                image
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
#if !os(visionOS)
                    .accessibilityHidden(true)
                    .symbolRenderingMode(mode)
#else
                    .foregroundStyle(Color.primary)
#endif
            case .primary:
                image
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
#if !os(visionOS)
                    .symbolRenderingMode(mode)
                    .foregroundStyle(shape[0])
#else
                    .foregroundStyle(Color.primary)
#endif
            case .secondary:
                image
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
#if !os(visionOS)
                    .symbolRenderingMode(mode)
                    .foregroundStyle(shape[0],shape[1])
#else
                    .foregroundStyle(Color.primary)
#endif
            case .tertiary:
                image
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
#if !os(visionOS)
                    .symbolRenderingMode(mode)
                    .foregroundStyle(shape[0],shape[1],shape[2])
#else
                    .foregroundStyle(Color.primary)
#endif
            }
            VStack(alignment: .leading, spacing: 5) {
                content
            }
            //これいらないのでは
            //.frame(maxHeight: .infinity)
        }
        .padding(.horizontal, 25)
    }
}

#Preview("Onboarding Item") {
    ScrollView {
        OnboardingItem(systemName: "doc",mode: .palette,primary: .red,secondary: .blue) {
            Text("Sample Subtitle \(1)")
                .onboardingStyle(style: .subtitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .content)
        }
        
        OnboardingItem(systemName: "doc.fill",shape: .red) {
            Text("Sample Subtitle \(2)")
                .onboardingStyle(style: .subtitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .content)
        }
        
        OnboardingItem(systemName: "arrow.down.doc") {
            Text("Sample Subtitle \(3)")
                .onboardingStyle(style: .subtitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .content)
        }
        
        OnboardingItem {
            Image(systemName: "arrow.up.doc")
        } content: {
            Text("Sample Subtitle \(3)")
                .onboardingStyle(style: .subtitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .content)
        }
    }
}
