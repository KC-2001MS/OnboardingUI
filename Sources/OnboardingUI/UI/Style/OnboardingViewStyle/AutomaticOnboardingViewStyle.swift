//
//  AutomaticOnboardingViewStyle.swift
//  OnboardingUI
//
//  Created by 茅根 啓介 on 2025/07/17.
//

import SwiftUI

@available(iOS 17, macOS 14, tvOS 17, visionOS 1, *)
@available(watchOS, unavailable)
public struct AutomaticOnboardingViewStyle: OnboardingViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        #if os(visionOS)
        ClassicOnboardingViewStyle().makeBody(configuration: configuration)
        #else
        if #available(iOS 26, macOS 26, tvOS 26, *) {
            ColoredGlassOnboardingViewStyle().makeBody(configuration: configuration)
        } else {
            ClassicOnboardingViewStyle().makeBody(configuration: configuration)
        }
        #endif
    }
}

@available(iOS 17, macOS 14, tvOS 17, visionOS 1, *)
@available(watchOS, unavailable)
extension OnboardingViewStyle where Self == AutomaticOnboardingViewStyle {
    /// The regular About view style to use with an About view.
    public static var automatic: AutomaticOnboardingViewStyle {
        return AutomaticOnboardingViewStyle()
    }
}


#Preview {
        OnboardingView(onboarding: PreviewWhatIsNewOnboarding())
            .onboardingViewStyle(.automatic)
}

