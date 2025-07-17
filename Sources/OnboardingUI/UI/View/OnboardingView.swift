//
//  OnboardingView.swift
//  OnboardingUI
//
//  Created by 茅根 啓介 on 2025/07/07.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
public struct OnboardingView<O: Onboarding>: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    @Environment(
        \.onboardingViewStyle
    ) private var onboardingViewStyle: AnyOnboardingViewStyle
    
    var onboarding: O
    
    init(onboarding: O) {
        self.onboarding = onboarding
    }
    
    public var body: some View {
        onboardingViewStyle
            .makeBody(
                configuration: .init(
                    dynamicTypeSize: dynamicTypeSize,
                    title: .init(onboarding.title),
                    content: .init(onboarding.features),
                    footer: .init {
                        if let link = onboarding.link {
                            link
                        }
                    },
                    dismissButton: .init(text: Text("Continue", bundle: .module))
                )
            )
    }
}

#Preview {
    if #available(iOS 18, macOS 15, tvOS 18, visionOS 2, *) {
        OnboardingView(onboarding: PreviewWhatIsNewOnboarding())
    }
}
