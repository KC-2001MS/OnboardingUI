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
                Text("Some Contents \(1)")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                    .foregroundStyle(Color.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
                
                OnboardingView(isPresented: $isOpeningOnboarding, onboarding: WhatIsNewOnboarding())
                
                Text("Some Contents \(2)")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                    .foregroundStyle(Color.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
            }
            .navigationTitle("Onboarding Card")
        }
    }
}

#Preview {
    OnboardingCardView()
}
