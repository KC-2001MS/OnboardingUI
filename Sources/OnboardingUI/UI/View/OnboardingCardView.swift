//
//  OnboardingView.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/13.
//


import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// View to show onboarding
public struct OnboardingCardView: View {
    /// Variables that control the display state
    @Binding var isPresented: Bool
    /// Display Contents
    public let onboarding: any Onboarding
    /// Default initializer
    public init(isPresented: Binding<Bool>, onboarding: any Onboarding) {
        self._isPresented = isPresented
        self.onboarding = onboarding
    }
    /// View
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
    
    return ScrollView {
        OnboardingCardView(isPresented: $isPresented, onboarding: PreviewWhatIsNewOnboarding()).padding()
    }
}
