//
//  ClassicOnboardingViewStyle.swift
//  OnboardingUI
//
//  Created by 茅根 啓介 on 2025/07/04.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
public struct ClassicOnboardingViewStyle: OnboardingViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            GeometryReader { geom in
                VStack(alignment: .center) {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center,spacing: geom.size.height / 60) {
                            VStack(spacing: 0) {
                                
                                configuration.title
#if os(macOS)
                                    .font(
                                        .custom(
                                            "",
                                            size: CGFloat(40),
                                            relativeTo: .largeTitle
                                        )
                                    )
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
                                    .accessibilityLabel(configuration.title.text)
                                    .padding(.vertical, geom.size.height / 20)
                            }
                            
                            VStack(alignment: .leading, spacing: 35) {
                                configuration.content { feature in
                                    if let image = feature.image {
                                        
                                        OnboardingItem {
                                            image
                                        } content: {
                                            if let message = feature.message {
                                                feature.title
                                                    .onboardingTextFormatting(
                                                        style: .subtitle
                                                    )
                                                message
                                                    .onboardingTextFormatting(
                                                        style: .content
                                                    )
                                            }
                                        }
                                        
                                    }
                                }
                            }
#if os(iOS)
                            .frame(maxWidth: 440)
#elseif os(macOS)
                            .frame(maxWidth: 350)
#elseif os(visionOS)
                            .frame(maxWidth: 555)
#else
                            .frame(maxWidth: .infinity)
#endif
                            if configuration.dynamicTypeSize > .xxxLarge {
                                configuration.footer
                                
                                DismissButton {
                                    configuration.dismissLabel
                                }
                                .buttonStyle(ColorButtonStyle())
#if os(iOS)
                                .padding(
                                    .bottom,
                                    70 - geom.size.height/15 + geom.size.height/20
                                )
#elseif os(visionOS)
                                .padding(.bottom, geom.size.height/25)
#elseif os(macOS)
                                .padding(.bottom, 15 + geom.size.height/20)
#else
                                .padding(.bottom, geom.size.height/20)
#endif
                            }
                        }
#if os(visionOS)
                        .padding(.top, geom.size.height/25)
#else
                        .padding(.top, geom.size.height/20)
#endif
                    }
                    
                    if configuration.dynamicTypeSize <= .xxxLarge {
                        Spacer()
                        
#if !os(tvOS)
                        configuration.footer
#if os(macOS)
                            .padding(30)
#else
                            .padding(.vertical, 5)
#endif
#endif
                        
                        DismissButton {
                            configuration.dismissLabel
                        }
                        .buttonStyle(ColorButtonStyle())
#if os(iOS)
                        .padding(
                            .bottom,
                            70 - geom.size.height/15 + geom.size.height/20
                        )
#elseif os(visionOS)
                        .padding(.bottom, geom.size.height/25)
#elseif os(macOS)
                        .padding(.bottom, 15 + geom.size.height/20)
#else
                        .padding(.bottom, geom.size.height/20)
#endif
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            }
        }
#if os(iOS)
        .frame(maxWidth: 500)
#elseif os(macOS)
        .frame(minWidth: 600,minHeight: 700, alignment: .center)
#elseif os(visionOS)
        .frame(width: 655,height: 695, alignment: .center)
#elseif os(tvOS)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
#endif
    }
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
extension OnboardingViewStyle where Self == ClassicOnboardingViewStyle {
    /// The regular About view style to use with an About view.
    public static var classic: ClassicOnboardingViewStyle {
        return ClassicOnboardingViewStyle()
    }
}


#Preview {
    OnboardingView(onboarding: PreviewWhatIsNewOnboarding())
        .onboardingViewStyle(.classic)
}
