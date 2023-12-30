//
//  NewFeatureOnboardingSheetView.swift
//  Sample
//
//  Created by 茅根 啓介 on 2023/12/15.
//

import SwiftUI
import OnboardingUI

struct NewFeatureOnboardingSheetView: View {
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        OnboardingSheetView {
            OnboardingTitle("What's New in\nOnboardingUI")
        } content: {
            OnboardingItem(systemName: "tree",shape: .green) {
                OnboardingSubtitle("New AppVersionManager environment variable")
                OnboardingContent("The new AppVersionManager environment variable allows you to display onboarding at the intended time.")
            }
            
            OnboardingItem(systemName: "building.columns",shape: .blue) {
                OnboardingSubtitle("New Onboarding protocol and Feature structure")
                OnboardingContent("The new Onboarding protocol and Feature structure make it easier to create onboarding. There is no need to build views.")
            }
            
            OnboardingItem(systemName: "wrench.and.screwdriver",shape: .orange) {
                OnboardingSubtitle("Customize the look and feel")
                OnboardingContent("Of course, it is also customizable. You can build onboarding at will.")
            }
        } button: {
            ContinueButton(color: .accentColor, action: action)
        }
    }
}

#Preview {
    NewFeatureOnboardingSheetView(action: {})
}
