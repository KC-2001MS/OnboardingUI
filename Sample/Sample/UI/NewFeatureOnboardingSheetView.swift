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
            Text("What's New in\nOnboardingUI")
                .onboardingTextFormatting(style: .title)
        } content: {
            OnboardingItem(systemName: "wrench.and.screwdriver",shape: .red) {
                Text("New AppVersionManager environment variable")
                    .onboardingTextFormatting(style: .subtitle)
                Text("The new AppVersionManager environment variable allows you to display onboarding at the intended time.")
                    .onboardingTextFormatting(style: .content)
            }
            
            OnboardingItem(systemName: "building.columns",shape: .blue) {
                Text("New Onboarding protocol and Feature structure")
                    .onboardingTextFormatting(style: .subtitle)
                Text("The new Onboarding protocol and Feature structure make it easier to create onboarding. There is no need to build views.")
                    .onboardingTextFormatting(style: .content)
            }
            
            OnboardingItem(systemName: "wrench.and.screwdriver",shape: .orange) {
                Text("Customize the look and feel")
                    .onboardingTextFormatting(style: .subtitle)
                Text("Of course, it is also customizable. You can build onboarding at will.")
                    .onboardingTextFormatting(style: .content)
            }
        } button: {
            ContinueButton(color: .accentColor, action: action)
        }
    }
}

#Preview {
    NewFeatureOnboardingSheetView(action: {})
}
