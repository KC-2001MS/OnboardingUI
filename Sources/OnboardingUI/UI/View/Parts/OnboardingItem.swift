//
//  OnboardingItem.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct OnboardingItem<Content: View,S: ShapeStyle>: View {
    var content: Content
    var image: Image
    var mode: SymbolRenderingMode?
    var shape: Array<S> = []
    private var shapeSize: ShapeSize
    
    private enum ShapeSize {
        case none
        case primary
        case secondary
        case tertiary
    }
    
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
    
    public init(
        systemName: String,
        mode: SymbolRenderingMode? = .palette,
        primary: S = Color.accentColor,
        tertiary: S = Color.accentColor,
        secondary: S = Color.accentColor,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.image = Image(systemName: systemName)
        self.mode = mode
        self.shape = [primary, secondary, tertiary]
        self.shapeSize = .tertiary
    }
    
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
                    .accessibilityHidden(true)
                    .symbolRenderingMode(mode)
            case .primary:
                image
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
                    .symbolRenderingMode(mode)
                    .foregroundStyle(shape[0])
            case .secondary:
                image
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
                    .symbolRenderingMode(mode)
                    .foregroundStyle(shape[0],shape[1])
            case .tertiary:
                image
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
                    .symbolRenderingMode(mode)
                    .foregroundStyle(shape[0],shape[1],shape[2])
            }
            VStack(alignment: .leading, spacing: 5) {
                content
            }
            //これいらないのでは
            .frame(maxHeight: .infinity)
        }
        .padding(OnboardingEdgeInsets)
    }
}

#Preview("Onboarding Item") {
    ScrollView {
        OnboardingItem(systemName: "macbook.and.ipad",mode: .palette,primary: .red,secondary: .blue) {
            Text("Sample Subtitle \(1)")
                .onboardingStyle(style: .subtitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .content)
        }
        
        OnboardingItem(systemName: "doc",shape: .red) {
            Text("Sample Subtitle \(2)")
                .onboardingStyle(style: .subtitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .content)
        }
        
        OnboardingItem(systemName: "doc") {
            Text("Sample Subtitle \(3)")
                .onboardingStyle(style: .subtitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .content)
        }
       
        OnboardingItem {
            Image(systemName: "doc")
        } content: {
            Text("Sample Subtitle \(3)")
                .onboardingStyle(style: .subtitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .content)
        }
    }
}
