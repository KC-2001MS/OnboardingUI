//
//  OnboardingStyle.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// The three items that comprise onboarding
public enum OnboardingTextFormattingStyle {
    case title
    case subtitle
    case content
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public extension Text {
    /// Modifier to change the style to suit it.
    func onboardingTextFormatting(style: OnboardingTextFormattingStyle) -> some View {
        Group {
            switch style {
            case .title:
                self
#if os(macOS)
                    .font(.custom("", size: CGFloat(40), relativeTo: .largeTitle))
                    .fontWeight(.regular)
#elseif os(visionOS)
                    .font(.extraLargeTitle2)
                    .fontWeight(.bold)
#else
                    .font(.largeTitle)
                    .fontWeight(.bold)
#endif
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.75)
                    .lineLimit(3)
                    .accessibilityLabel(self)
            case .subtitle:
                self
#if os(macOS)
                    .font(.body)
#elseif os(tvOS)
                    .font(.subheadline)
#else
                    .font(.subheadline)
#endif
                    .foregroundColor(.primary)
                    .bold()
                    .minimumScaleFactor(0.75)
                    .lineLimit(3)
                    .accessibilityLabel(self)
            case .content:
                self
#if os(macOS)
                    .font(.body)
#elseif os(tvOS)
                    .font(.caption)
#else
                    .font(.custom("", size: CGFloat(15.5), relativeTo: .body))
#endif
                    .foregroundColor(.secondary)
                    .minimumScaleFactor(0.75)
                    .lineLimit(7)
                    .accessibilityLabel(self)
            }
        }
    }
}

#Preview("Modifier") {
    VStack(spacing: 10){
        Text(String("Sample Title"))
            .onboardingTextFormatting(style: .title)
        
        Text(String("Sample Subtitle"))
            .onboardingTextFormatting(style: .subtitle)
        
        Text(String("Sample Content"))
            .onboardingTextFormatting(style: .content)
    }
}
