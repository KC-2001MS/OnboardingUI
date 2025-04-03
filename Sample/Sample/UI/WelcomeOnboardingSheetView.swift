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
            OnboardingTitle("Welcome to\nOnboardingUI")
        } content: {
            OnboardingItem(systemName: "applescript",shape: .red) {
                OnboardingSubtitle("Easy to Make")
                OnboardingContent("Onboarding screens like Apple's stock apps can be easily created with SwiftUI.")
            }
            
            OnboardingItem(systemName: "apple.logo") {
                OnboardingSubtitle("Not only for iPhone, but also for Mac, iPad, Vision Pro")
                OnboardingContent("It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device.")
            }
            
            OnboardingItem(systemName: "circle.badge.checkmark",mode: .palette,primary: .primary,secondary: .blue) {
                OnboardingSubtitle("Customize SF Symbols")
                OnboardingContent("When using a highly customizable implementation method, multi-color and SF symbol hierarchies are supported and can be freely customized.")
            }
            
#if os(tvOS)
            OnboardingItem(systemName: "ellipsis",shape: .white) {
                OnboardingSubtitle("Many other benefits")
                OnboardingContent("Now, tvOS is also supported, making it easy to create onboarding. Now you can create onboarding for all platforms except watchOS.")
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
