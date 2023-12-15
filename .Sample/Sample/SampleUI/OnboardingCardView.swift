//
//  OnboardingCardView.swift
//  Sample
//
//  Created by Keisuke Chinone on 2023/12/10.
//


import SwiftUI
import OnboardingUI

struct OnboardingCardView: View {
    @State private var isOpeningOnboarding = true
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                OnboardingView(isPresented: $isOpeningOnboarding, onboarding: WhatIsNewOnboarding())
            }
            .navigationTitle("Onboarding Card")
        }
    }
}

#Preview {
    OnboardingCardView()
}
