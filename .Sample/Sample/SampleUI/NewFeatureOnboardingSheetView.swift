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
        OnboardingSheet {
            OnboardingTitle("What's New in\nAppVersionManager")
        } content: {
            OnboardingItem(systemName: "bookmark",shape: .red) {
                OnboardingSubtitle("Manage startup status")
                OnboardingContent("The current version of the app can be compared to the version of the app when it was last opened to determine if it was opened after an update or launched for the first time.")
            }
            
            OnboardingItem(systemName: "link") {
                OnboardingSubtitle("Bindable")
                OnboardingContent("By setting the environment variable to Bindable, the onboarding display can be toggled at the appropriate time.")
            }
            
            OnboardingItem(systemName: "app.badge.checkmark",mode: .palette,primary: .green,secondary: .blue) {
                OnboardingSubtitle("Easy onboarding display rules")
                OnboardingContent("It can be easily monitored simply by using environment variables.")
            }
        } button: {
            ContinueButton(color: .accentColor, action: action)
        }
    }
}

#Preview {
    NewFeatureOnboardingSheetView(action: {})
}
