//
//  Onboardings.swift
//  Sample
//  
//  Created by Keisuke Chinone on 2023/12/11.
//


import Foundation
import OnboardingUI
import SwiftUI

struct WelcomeOnboarding: Onboarding {
    var title: Text {
        Text("Welcome to\nOnboardingUI")
    }
    
    var link: Link<Text>? {
        Link("Check our Privacy Policy…", destination: URL(string: "https://kc-2001ms.github.io/en/privacy.html")!)
    }
    
    var features: Array<Feature> {
        Feature(
            "Easy to Make" ,
            imageName: "applescript",
            message: "Onboarding screens like Apple's stock apps can be easily created with SwiftUI."
        )
        
        Feature(
            "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
            imageName: "apple.logo",
            message: "It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device."
        )
#if os(iOS)
        .image(systemName: "ipad.and.iphone")
#elseif os(macOS)
        .image(systemName: "macbook")
#elseif os(tvOS)
        .image(systemName: "appletv")
#elseif os(visionOS)
        .image(systemName: "visionpro")
#endif
        
        Feature(
            "Customize SF Symbols" ,
            imageName: "circle.badge.checkmark",
            message: "When using a highly customizable implementation method, multi-color and SF symbol hierarchies are supported and can be freely customized."
        )
    }
}

struct WhatIsNewOnboarding: Onboarding {
    var id: UUID = UUID()
    
    var title: Text {
        Text("What's New in\nOnboardingUI")
    }
    
    var features: Array<Feature> {
        Feature(
            "New AppVersionManager environment variable" ,
            imageName: "wrench.and.screwdriver",
            message: "The new AppVersionManager environment variable allows you to display onboarding at the intended time."
        )
        
        Feature(
            "New Onboarding protocol and Feature structure" ,
            imageName: "building.columns",
            message: "The new Onboarding protocol and Feature structure make it easier to create onboarding. There is no need to build views."
        )
        
        Feature(
            "Customize the look and feel" ,
            imageName: "wrench.and.screwdriver",
            message: "Of course, it is also customizable. You can build onboarding at will."
        )
    }
}
