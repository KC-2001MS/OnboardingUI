//
//  modifier.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct ColorButtonStyle: ButtonStyle {
    var foregroundColor: Color = .white
    var backgroundColor: Color = .accentColor
    
    public init() {
        self.foregroundColor = .white
        self.backgroundColor = .accentColor
    }
    
    public init(foregroundColor: Color,backgroundColor: Color) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
#if os(macOS)
            .padding([.top, .bottom], 10)
#else
            .padding([.top, .bottom], 15)
#endif
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
#if os(macOS)
            .cornerRadius(7)
#else
            .cornerRadius(15)
#endif
            .padding(OnboardingEdgeInsets)
    }
}

@available(iOS 17.0,macOS 14,visionOS 1,*)
public enum OnboardingStyle {
    case title
    case itemTitle
    case itemContent
    case button
}

@available(iOS 17.0,macOS 14,visionOS 1,*)
public extension Text {
    func onboardingStyle(style: OnboardingStyle) -> some View {
        Group {
            switch style {
            case .title:
                self
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            case .itemTitle:
                self
                    .font(.system(size: 15))
                    .font(.headline)
                    .foregroundColor(.primary)
                    .bold()
                    .lineLimit(1)
            case .itemContent:
                self
                    .font(.system(size: 15))
                    .font(.body)
                    .foregroundColor(.secondary)
            case .button:
                self
                    .bold()
                    .foregroundColor(.white)
#if os(macOS)
                    .frame(minWidth: 0, maxWidth: 130)
#else
                    .frame(minWidth: 0, maxWidth: .infinity)
#endif
            }
        }
    }
}

#Preview("Modifier") {
    Group {
        Text("Onboarding Title")
            .onboardingStyle(style: .title)
        
        
        Button(action: {
            
        }) {
            Text("Continue")
                .onboardingStyle(style: .button)
        }
        .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: .red))
    }
}
