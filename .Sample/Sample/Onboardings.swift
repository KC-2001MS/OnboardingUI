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
            imageName: "keyboard",
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
        #elseif os(visionOS)
        Feature(
            "Not only for iPhone, but also for Mac, iPad, Vision Pro" ,
            imageName: "visionpro",
            message: "It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device."
        )
        #endif
        Feature(
            "Customize SF Symbols" ,
            imageName: "macbook.and.iphone",
            message: "It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish."
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
            "New Onboarding protocol and Feature structure" ,
            imageName: "building.columns",
            message: "The new Onboarding protocol and Feature structure make it easier to create onboarding. There is no need to build views."
        )
        Feature(
            "Vision Pro Support" ,
            imageName: "visionpro",
            message: "Vision Pro support has also been added. Onboarding can be built just like any other platform."
        )
        Feature(
            "Customize the look and feel" ,
            imageName: "wrench.and.screwdriver",
            message: "Of course, it is also customizable. You can build onboarding at will."
        )
    }
}
