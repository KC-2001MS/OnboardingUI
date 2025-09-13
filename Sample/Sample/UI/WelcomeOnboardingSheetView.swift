//
//  OnboardingSheetView.swift
//  Sample
//
//  Created by Keisuke Chinone on 2023/12/10.
//


import SwiftUI
import OnboardingUI

struct WelcomeOnboardingSheetView: View {
    @Environment(\.dismiss) private var dismiss
    
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
                
#if os(tvOS)
                OnboardingItem(systemName: "ellipsis",shape: .white) {
                    Text("Many other benefits")
                        .onboardingTextFormatting(style: .subtitle)
                    
                    Text("Now, tvOS is also supported, making it easy to create onboarding. Now you can create onboarding for all platforms except watchOS.")
                        .onboardingTextFormatting(style: .content)
                }
#endif
            } link: {
                Link("Check our Privacy Policy…", destination: URL(string: "https://kc-2001ms.github.io/en/privacy.html")!)
            } button: {
                ContinueButton(color: .accentColor, action: {
                    dismiss()
                })
            }
    
    }
}

#Preview {
    WelcomeOnboardingSheetView(action: {})
}
