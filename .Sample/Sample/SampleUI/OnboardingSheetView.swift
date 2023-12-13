//
//  OnboardingSheetView.swift
//  Sample
//  
//  Created by Keisuke Chinone on 2023/12/10.
//


import SwiftUI
import OnboardingUI

struct OnboardingSheetView: View {
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        OnboardingSheet {
            OnboardingTitle("Welcome to\nOnboardingUI Sample App")
        } content: {
            OnboardingItem(systemName: "keyboard",color: .red) {
                OnboardingItemTitle("Easy to Make")
                OnboardingItemContent("Onboarding screens like Apple's stock apps can be easily created with SwiftUI.")
            }
            
            OnboardingItem(systemName: "macbook.and.ipad") {
                OnboardingItemTitle("Not only for iPhone, but also for Mac and iPad")
                OnboardingItemContent("It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device.")
            }
            
            if #available(macOS 12,iOS 15, *) {
                OnboardingItemParts(systemName: "macbook.and.iphone",mode: .palette,primary: .primary,secondary: .blue) {
                    OnboardingItemTitle("Customize SF Symbols")
                    OnboardingItemContent("It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish.")
                }
            }
        } button: {
            ContinueButton(color: .accentColor, action: action)
        }
    }
}

#Preview {
    OnboardingSheetView(action: {})
}
