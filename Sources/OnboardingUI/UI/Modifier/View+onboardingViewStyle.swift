//
//  onboardingViewStyle.swift
//  OnboardingUI
//
//  Created by 茅根 啓介 on 2025/07/07.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
public extension View {
    func onboardingViewStyle(_ style: some OnboardingViewStyle) -> some View {
        self.environment(\.onboardingViewStyle, AnyOnboardingViewStyle(style))
    }
}

