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
    var id: UUID = UUID()
    
    var title: Text {
        Text("Welcome to\nOnboardingUI")
    }
    
    var features: Array<Feature> {
        Feature(
            "Easy to Make" ,
            imageName: "applescript",
            message: "Onboarding screens like Apple's stock apps can be easily created with SwiftUI."
        )
#if os(iOS)
        Feature(
            "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
            imageName: "ipad.and.iphone",
            message: "It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device."
        )
#elseif os(macOS)
        Feature(
            "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
            imageName: "macbook",
            message: "It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device."
        )
#elseif os(tvOS)
        Feature(
            "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
            imageName: "appletv",
            message: "It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device."
        )
#elseif os(visionOS)
        Feature(
            "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
            imageName: "visionpro",
            message: "It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device."
        )
#endif
        Feature(
            "Customize SF Symbols" ,
            imageName: "circle.badge.checkmark",
            message: "When using a highly customizable implementation method, multi-color and SF symbol hierarchies are supported and can be freely customized. However, this feature is not supported in visionOS."
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
