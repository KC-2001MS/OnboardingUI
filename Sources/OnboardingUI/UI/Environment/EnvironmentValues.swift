//
//  EnvironmentValues.swift
//  OnboardingUI
//
//  Created by 茅根 啓介 on 2025/07/07.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
extension EnvironmentValues {
    @Entry internal var onboardingViewStyle: AnyOnboardingViewStyle = AnyOnboardingViewStyle(.automatic)
}
