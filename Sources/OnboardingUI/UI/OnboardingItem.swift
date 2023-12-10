//
//  OnboardingItem.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct OnboardingItem<Content: View>: View {
    let content: Content
    let systemName: String
    let color: Color?
    
    public init(systemName: String,color: Color? = .accentColor,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.color = color
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .font(.largeTitle)
                .foregroundColor(color)
                .frame(width: 35, height: 35)
                .padding(5)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 5) {
                content
            }
            .frame(maxHeight: .infinity)
        }
        .padding(OnboardingEdgeInsets)
    }
}

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct OnboardingItemParts<Content: View,S: ShapeStyle>: View {
    var content: Content
    var systemName: String
    var mode: SymbolRenderingMode?
    var shape: Array<S>
    private var shapeSize: ShapeSize
    
    private enum ShapeSize {
        case none
        case primary
        case secondary
        case tertiary
    }
    
    public init(systemName: String,mode: SymbolRenderingMode? = .monochrome,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.mode = mode
        self.shape = []
        self.shapeSize = .none
    }
    
    public init(systemName: String,mode: SymbolRenderingMode? = .monochrome,shape: S = Color.accentColor,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.mode = mode
        self.shape = [shape]
        self.shapeSize = .primary
    }
    
    public init(systemName: String,mode: SymbolRenderingMode? = .palette,primary: S = Color.accentColor,secondary: S = Color.accentColor,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.mode = mode
        self.shape = [primary, secondary]
        self.shapeSize = .secondary
    }
    
    public init(systemName: String,mode: SymbolRenderingMode? = .palette,primary: S = Color.accentColor,tertiary: S = Color.accentColor,secondary: S = Color.accentColor,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.mode = mode
        self.shape = [primary, secondary, tertiary]
        self.shapeSize = .tertiary
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            switch shapeSize {
            case .none:
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
                    .symbolRenderingMode(mode)
            case .primary:
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
                    .symbolRenderingMode(mode)
                    .foregroundStyle(shape[0])
            case .secondary:
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .accessibilityHidden(true)
                    .symbolRenderingMode(mode)
                    .foregroundStyle(shape[0],shape[1])
            case .tertiary:
                Image(systemName: systemName)
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
            .frame(maxHeight: .infinity)
        }
        .padding(OnboardingEdgeInsets)
    }
}

#Preview("Onboarding Item") {
    Group {
        OnboardingItem(systemName: "doc",color: .red) {
            Text("Sample Title")
                .onboardingStyle(style: .itemTitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .itemContent)
        }
        
        OnboardingItem(systemName: "doc") {
            Text("Sample Title")
                .onboardingStyle(style: .itemTitle)
            Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                .onboardingStyle(style: .itemContent)
        }
        
        if #available(macOS 12,iOS 15, *) {
            OnboardingItemParts(systemName: "macbook.and.ipad",mode: .palette,primary: .red,secondary: .blue) {
                Text("Sample Title")
                    .onboardingStyle(style: .itemTitle)
                Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                    .onboardingStyle(style: .itemContent)
            }
            
            OnboardingItemParts(systemName: "doc",shape: .red) {
                Text("Sample Title")
                    .onboardingStyle(style: .itemTitle)
                Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                    .onboardingStyle(style: .itemContent)
            }
            
            OnboardingItemParts(systemName: "doc") {
                Text("Sample Title")
                    .onboardingStyle(style: .itemTitle)
                Text("This is a sample text. This text will allow you to see how it will appear in this framework. See the preview.")
                    .onboardingStyle(style: .itemContent)
            }
        }
    }
}
