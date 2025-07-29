//
//  OnboardingStyle.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

/// The three items that comprise onboarding
@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
public enum OnboardingTextFormattingStyle {
    case title
    case subtitle
    case content
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
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
                    .font(.headline)
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
                    .font(.body)
#else
                //                    .font(.callout)
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
