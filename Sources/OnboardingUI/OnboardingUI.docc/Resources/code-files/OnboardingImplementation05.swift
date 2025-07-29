import SwiftUI
import OnboardingUI

struct WelcomeOnboarding: Onboarding {
    var title: Text {
        Text("Welcome to\nOnboardingUI")
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
        
#if os(tvOS)
        Feature(
            "Many other benefits" ,
            imageName: "ellipsis",
            message: "Now, tvOS is also supported, making it easy to create onboarding. Now you can create onboarding for all platforms except watchOS."
        )
#endif
    }
}
