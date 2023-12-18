//
//  OnboardingStyle.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// The three items that comprise onboarding
public enum OnboardingStyle {
    case title
    case subtitle
    case content
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public extension Text {
    /// Modifier to change the style to suit it.
    func onboardingStyle(style: OnboardingStyle) -> some View {
        Group {
            switch style {
            case .title:
                self
                    .fontWeight(.bold)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.75)
                    .lineLimit(3)
            case .subtitle:
                self
                    .font(.headline)
                    .foregroundColor(.primary)
                    .bold()
                    .minimumScaleFactor(0.75)
                    .lineLimit(3)
            case .content:
                self
                    .font(.body)
                    .foregroundColor(.secondary)
                    .minimumScaleFactor(0.75)
                    .lineLimit(7)
            }
        }
    }
}

#Preview("Modifier") {
    VStack(spacing: 10){
        Text("Sample Title")
            .onboardingStyle(style: .title)
        
        Text("Sample Subtitle")
            .onboardingStyle(style: .subtitle)
        
        Text("Sample Content")
            .onboardingStyle(style: .content)
    }
}
