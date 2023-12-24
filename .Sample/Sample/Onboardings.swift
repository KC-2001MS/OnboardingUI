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

struct PhotosFakeOnboarding: Onboarding {
    var title: Text {
        Text(String("What's New in Photos"))
    }
    
    var features: Array<Feature> {
        Feature(
            String("Albums in the Photos Widget") ,
            imageName: "rectangle.stack",
            message: String("Enjoy your photos from any custom album in the Photos widget.")
        )
        
        Feature(
            String("Pets Albums") ,
            imageName: "pawprint",
            message: String("Find photos and videos of your cat or dog in the Albums tab, along with people.")
        )
        
        Feature(
            String("Pinch to Crop") ,
            imageName: "crop.rotate",
            message: String("Crop, rotate, or flip any photo faster by pinching to zoom, then tapping Crop.")
        )
        
        Feature(
            String("More Customizable Memories") ,
            imageName: "memories",
            message: String("Reorder the photos and videos in a Memory or add any photo from your library.")
        )
    }
}

struct XcodeFakeOnboarding: Onboarding {
    var title: Text {
        Text(String("What's New in Xcode"))
    }
    
    var link: Link<Text>? {
        Link(String("Complete feature list >"), destination: URL(string: "https://kc-2001ms.github.io/en/privacy.html")!)
    }
    
    var features: Array<Feature> {
        Feature(
            String("Xcode Cloud") ,
            imageName: "cloud",
            message: String("See live status, build, and test results from your Xcode Cloud workflows.")
        )
        
        Feature(
            String("SwiftUl") ,
            imageName: "swift",
            message: String("Previews are interactive by default and provide multiple Ul variations for appearance, text sizes and more.")
        )
        
        Feature(
            String("Multiplatform Apps") ,
            imageName: "macbook.and.iphone",
            message: String("Create multiplatform apps across iOS, iPadOS, macOS, and tvOS from a single target.")
        )
        
        Feature(
            String("And More!") ,
            imageName: "seal",
            message: String("Automatic app icon generation for all sizes, pinned code structure in source editor, visual TestFlight feedback, and build timeline assistant.")
        )
    }
}

struct FreeformFakeOnboarding: Onboarding {
    var title: Text {
        Text(String("Welcome to Freeform"))
    }
    
    var features: Array<Feature> {
        Feature(
            String("Get Creative") ,
            imageName: "rectangle.stack",
            message: String("Sketch out a project, design a mood board, brainstorm ideas, and so much more.")
        )
        
        Feature(
            String("Build Your Board") ,
            imageName: "pawprint",
            message: String("Add media, files, links, text, and more anywhere on a board to design your creative space.")
        )
        
        Feature(
            String("Collaborate with Others") ,
            imageName: "crop.rotate",
            message: String("Invite people to your board and develop your best ideas together in real time.")
        )
    }
}
