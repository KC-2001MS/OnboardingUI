//
//  OnboardingItem.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

//項目View（完成）
@available(iOS 14.0,macOS 11,*)
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

@available(iOS 15.0,macOS 12,*)
public struct OnboardingItemParts<Content: View,S: ShapeStyle>: View {
    let content: Content
    let systemName: String
    var mode: SymbolRenderingMode?
    let shape: S
    
    
    public init(systemName: String,mode: SymbolRenderingMode? = nil,shape: S = Color.accentColor,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.mode = mode
        self.shape = shape
    }
    
    
    
    public var body: some View {
        HStack(spacing: 10) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .font(.largeTitle)
                .symbolRenderingMode(mode)
                .foregroundStyle(shape)
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


struct OnboardingItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingItem(systemName: "doc",color: .red) {
            Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                .onboardingStyle(style: .itemTitle)
            Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                .onboardingStyle(style: .itemContent)
        }
        
        OnboardingItem(systemName: "doc") {
            Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                .onboardingStyle(style: .itemTitle)
            Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                .onboardingStyle(style: .itemContent)
        }
        
        if #available(macOS 12, *) {
            OnboardingItemParts(systemName: "doc",shape: .red) {
                Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                    .onboardingStyle(style: .itemTitle)
                Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                    .onboardingStyle(style: .itemContent)
            }
            
            OnboardingItemParts(systemName: "doc") {
                Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                    .onboardingStyle(style: .itemTitle)
                Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                    .onboardingStyle(style: .itemContent)
            }
        }

    }
}
