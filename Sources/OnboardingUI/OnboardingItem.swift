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
    let color: Color
    
    public init(systemName: String,color: Color,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.color = color
    }
    
    public init(systemName: String,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.color = Color.accentColor
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(5)
                .font(.largeTitle)
                .foregroundColor(color)
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
    }
}
