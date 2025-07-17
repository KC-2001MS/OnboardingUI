//
//  OnboardingSheetView.swift
//  Sample
//
//  Created by Keisuke Chinone on 2023/12/10.
//


import SwiftUI
import OnboardingUI

struct WelcomeOnboardingSheetView: View {
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        OnboardingSheetView {
            Text("Welcome to\nOnboardingUI")
                .onboardingTextFormatting(style: .title)
        } content: {
            OnboardingItem(systemName: "applescript",shape: .red) {
                Text("Easy to Make")
                    .onboardingTextFormatting(style: .subtitle)
                Text("Onboarding screens like Apple's stock apps can be easily created with SwiftUI.")
                    .onboardingTextFormatting(style: .content)
            }
            
            OnboardingItem(systemName: "apple.logo") {
                Text("Not only for iPhone, but also for Mac, iPad, Vision Pro")
                    .onboardingTextFormatting(style: .subtitle)
                Text("It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device.")
                    .onboardingTextFormatting(style: .content)
            }
            
            OnboardingItem(systemName: "circle.badge.checkmark",mode: .palette,primary: .primary,secondary: .blue) {
                Text("Customize SF Symbols")
                    .onboardingTextFormatting(style: .subtitle)
                Text("When using a highly customizable implementation method, multi-color and SF symbol hierarchies are supported and can be freely customized.")
                    .onboardingTextFormatting(style: .content)
            }
        } button: {
            ContinueButton(color: .accentColor, action: action)
        }
    }
}

#Preview {
    WelcomeOnboardingSheetView(action: {})
}
