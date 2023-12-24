//
//  Preview.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/16.
//


import Foundation
import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
struct PreviewWhatIsNewOnboarding: Onboarding {
    var title: Text {
        Text(String("What's New in\nOnboardingUI"))
    }
    
    var link: Link<Text>? {
        Link(String("Check our Privacy Policy…"), destination: URL(string: "https://kc-2001ms.github.io/en/privacy.html")!)
    }
    
    var features: Array<Feature> {
        Feature(
            String(String("Easy to Make")) ,
            imageName: "keyboard",
            message: String("Onboarding screens like Apple's stock apps can be easily created with SwiftUI.")
        )
        
        Feature(
            String("Not only for iPhone, but also for Mac, iPad, Vision Pro") ,
            imageName: "apple.logo",
            message: String("It supports not only iPhone, but also Mac, iPad, and Vision Pro. Therefore, there is no need to rewrite the code for each device.")
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
            String("Customize SF Symbols") ,
            imageName: "macbook.and.iphone",
            message: String("It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish.")
        )
    }
}
