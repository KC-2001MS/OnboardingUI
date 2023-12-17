//
//  Preview.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/16.
//


import Foundation
import SwiftUI

struct PreviewWhatIsNewOnboarding: Onboarding {
    var id: UUID = UUID()
    
    var title: Text {
        Text("What's New in\nOnboardingUI")
    }
    
    var features: Array<Feature> {
        Feature(
            String("Easy to Make") ,
            imageName: "keyboard",
            message: String("Onboarding screens like Apple's stock apps can be easily created with SwiftUI.")
        )
#if os(iOS)
        Feature(
            String("Not only for iPhone, but also for Mac, iPad, Vision Pro") ,
            imageName: "ipad.and.iphone",
            message: String("It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device.")
        )
#elseif os(macOS)
        Feature(
            String("Not only for iPhone, but also for Mac, iPad, Vision Pro") ,
            imageName: "macbook",
            message: String("It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device.")
        )
#elseif os(visionOS)
        Feature(
            String("Not only for iPhone, but also for Mac, iPad, Vision Pro") ,
            imageName: "visionpro",
            message: String("It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device.")
        )
#endif
        Feature(
            String("Customize SF Symbols") ,
            imageName: "macbook.and.iphone",
            message: String("It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish.")
        )
    }
}
