//
//  NewFeatureOnboardingSheetView.swift
//  Sample
//
//  Created by 茅根 啓介 on 2023/12/15.
//

import SwiftUI
import OnboardingUI

struct NewFeatureOnboardingSheetView: View {
    @Environment(\.dismiss) private var dismiss
    
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
            
#if os(tvOS)
            OnboardingItem(systemName: "ellipsis",shape: .white) {
                OnboardingSubtitle("Many other benefits")
                OnboardingContent("Now, tvOS is also supported, making it easy to create onboarding. Now you can create onboarding for all platforms except watchOS.")
            }
#endif
        } button: {
            ContinueButton(color: .accentColor, action: {
                dismiss()
            })
        }
    }
}

#Preview {
    NewFeatureOnboardingSheetView(action: {})
}
