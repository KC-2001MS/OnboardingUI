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
    
    struct WhatIsNewOnboarding: Onboarding {
        var id: UUID = UUID()
        
        var title: Text {
            Text("What's New in\nOnboardingUI")
        }
        
        var features: Array<Feature> {
            Feature(
                "Easy to Make" ,
                imageName: "keyboard",
                message: "Onboarding screens like Apple's stock apps can be easily created with SwiftUI."
            )
#if os(iOS)
            Feature(
                "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
                imageName: "ipad.and.iphone",
                message: "It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device."
            )
#elseif os(macOS)
            Feature(
                "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
                imageName: "macbook",
                message: "It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device."
            )
#elseif os(visionOS)
            Feature(
                "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
                imageName: "visionpro",
                message: "It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device."
            )
#endif
            Feature(
                "Customize SF Symbols" ,
                imageName: "macbook.and.iphone",
                message: "It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish."
            )
        }
    }
    
    return OnboardingView(isPresented: $isPresented, onboarding: WhatIsNewOnboarding())
}
