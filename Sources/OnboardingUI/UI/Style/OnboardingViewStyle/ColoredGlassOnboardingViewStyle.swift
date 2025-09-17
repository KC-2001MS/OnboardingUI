//
//  GlassOnboardingViewStyle.swift
//  OnboardingUI
//
//  Created by 茅根 啓介 on 2025/07/04.
//

import SwiftUI

@available(iOS 26, macOS 26, tvOS 26, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct ColoredGlassOnboardingViewStyle: OnboardingViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    configuration.title
                        .font(.title2)
                        .fontWeight(.bold)
                    VStack(alignment: .leading, spacing: 20) {
                        configuration.content { feature in
                            if let image = feature.image {
                                Group {
                                    if configuration.dynamicTypeSize <= .xxxLarge {
                                        HStack(alignment: .top,spacing: 20) {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .font(.largeTitle)
                                                .foregroundStyle(
                                                    Color.accentColor
                                                )
                                                .frame(
                                                    width: 37.5,
                                                    height: 37.5
                                                )
                                                .accessibilityHidden(true)
                                            
                                            VStack(
                                                alignment: .leading,
                                                spacing: 2.5
                                            ) {
                                                if let message = feature.message {
                                                        feature.title
                                                        .onboardingTextFormatting(style: .subtitle)
                                                    message
                                                        .onboardingTextFormatting(style: .content)
                                                }
                                            }
                                        }
                                    } else {
                                        VStack(alignment: .leading) {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .font(.largeTitle)
                                                .foregroundStyle(
                                                    Color.accentColor
                                                )
                                                .frame(
                                                    width: 37.5,
                                                    height: 37.5
                                                )
                                                .accessibilityHidden(true)
                                            
                                            VStack(
                                                alignment: .leading,
                                                spacing: 5
                                            ) {
                                                if let message = feature.message {
                                                        feature.title
                                                        .onboardingTextFormatting(style: .subtitle)
                                                    message
                                                        .onboardingTextFormatting(style: .content)
                                                }
                                            }
                                        }
                                    }
                                }
#if os(tvOS)
                                .focusable()
#endif
                            }
                        }
                    }
                    
                    if configuration.dynamicTypeSize > .xxxLarge {
                        configuration.footer
                        
                        DismissButton {
                            configuration.dismissLabel
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                        }
                        .buttonStyle(.glassProminent)
                        .padding(.horizontal, 40)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding([.horizontal, .bottom],40)
                .padding(.top, 80)
            }
            
            if configuration.dynamicTypeSize <= .xxxLarge {
                VStack(alignment: .center, spacing: 25) {
                    configuration.footer
                    
                    DismissButton {
                        configuration.dismissLabel
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                    }
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.capsule)
#if os(iOS)
  .padding(.horizontal, 40)
  .padding(.bottom, UIDevice.current.userInterfaceIdiom == .pad ? 40 : 0)
  #else
  .padding([.horizontal, .bottom], 40)
  #endif
                }
            }
        }
#if os(tvOS)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
#endif
    }
}

@available(iOS 26, macOS 26, tvOS 26, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension OnboardingViewStyle where Self == ColoredGlassOnboardingViewStyle {
    /// The regular About view style to use with an About view.
    public static var coloredGlass: ColoredGlassOnboardingViewStyle {
        return ColoredGlassOnboardingViewStyle()
    }
}

#if !os(visionOS)
#Preview {
    if #available(iOS 26, macOS 26, tvOS 26, *) {
        OnboardingView(onboarding: PreviewWhatIsNewOnboarding())
            .onboardingViewStyle(.coloredGlass)
    }
}
#endif
