//
//  OnboardingView.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/13.
//


import SwiftUI

public struct OnboardingView: View {
    @Binding var isPresented: Bool
    
    public let onboarding: any Onboarding
    
    public init(isPresented: Binding<Bool>, onboarding: any Onboarding) {
        self._isPresented = isPresented
        self.onboarding = onboarding
    }
    
    public var body: some View {
        if isPresented {
            OnboardingCard {
                onboarding.title
                    .onboardingStyle(style: .title)
            } content: {
                ForEach(onboarding.features) { feature in
                    if let image = feature.image {
                        OnboardingItem {
                            image
                        } content: {
                            if let message = feature.message {
                                OnboardingSubtitle(feature.title)
                                OnboardingContent(message)
                            }
                        }

                    }
                }
            } action: {
                isPresented.toggle()
            }

        } else {
            EmptyView()
        }
    }
}

#Preview {
    @State var isPresented = true
    
    return OnboardingView(isPresented: $isPresented, onboarding: PreviewWhatIsNewOnboarding())
}
