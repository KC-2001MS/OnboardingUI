//
//  OnboardingSheet.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/25.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// View to show onboarding in sheets
public struct OnboardingSheet<V1: View,V2: View,V3: View,V4: View>: View {
    /// Title View
    var title: V1
    /// View displaying features
    var content: V2
    
    var link: V3
    /// Button view at the bottom
    var button: V4
    /// Initializer for the three Views that make up the OnboardingSheet
    /// - Parameters:
    ///   - title: Title View
    ///   - content: View displaying features
    ///   - button: Button view at the bottom
    public init(
        @ViewBuilder title: () -> V1,
        @ViewBuilder content: () -> V2,
        @ViewBuilder link: () -> V3,
        @ViewBuilder button: () -> V4
    ) {
        self.title = title()
        self.content = content()
        self.link = link()
        self.button = button()
    }
    
    public init(
        @ViewBuilder title: () -> V1,
        @ViewBuilder content: () -> V2,
        link: V3 = EmptyView(),
        @ViewBuilder button: () -> V4
    ) {
        self.title = title()
        self.content = content()
        self.link = link
        self.button = button()
    }
    /// View
    public var body: some View {
        GeometryReader { geom in
            VStack(alignment: .center) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center,spacing: geom.size.height / 60) {
                        VStack(spacing: 0) {
                            
                            title
                                .padding(.vertical, geom.size.height / 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 35) {
                            content
                        }
#if os(iOS)
                        .frame(maxWidth: 440)
#elseif os(macOS)
                        .frame(maxWidth: 350)
#elseif os(visionOS)
                        .frame(maxWidth: 555)
#else
                        .frame(maxWidth: .infinity)
#endif
                    }
                }
                
                Spacer()
                
#if !os(tvOS)
                link
#if os(macOS)
                    .padding(30)
#else
                    .padding(.vertical, 5)
#endif
#endif
                
                button
#if os(iOS)
                    .frame(maxWidth: 440)
                    .padding(.bottom, 70 - geom.size.height/15)
#elseif os(macOS)
                    .padding(.bottom, 15)
#endif
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
#if os(visionOS)
            .padding(.vertical, geom.size.height/25)
#else
            .padding(.vertical, geom.size.height/20)
#endif
        }
#if os(iOS)
        .frame(maxWidth: 500)
#elseif os(macOS)
        .frame(minWidth: 600,minHeight: 700, alignment: .center)
#elseif os(visionOS)
        .frame(width: 655,height: 695, alignment: .center)
#endif
    }
}

#Preview("Onboarding Sheet 2") {
    OnboardingSheet {
        OnboardingTitle("Welcome to\nOnboardingUI")
    } content: {
        OnboardingItem(systemName: "keyboard",shape: .red) {
            OnboardingSubtitle("Easy to Make")
            OnboardingContent("Onboarding screens like Apple's stock apps can be easily created with SwiftUI.")
        }
        
        OnboardingItem(systemName: "macbook.and.ipad") {
            OnboardingSubtitle("Not only for iPhone, but also for Mac and iPad")
            OnboardingContent("It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device.")
        }
        
        OnboardingItem(systemName: "macbook.and.iphone",mode: .palette,primary: .primary,secondary: .blue) {
            OnboardingSubtitle("Customize SF Symbols")
            OnboardingContent("It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish.")
        }
    } link: {
        Link("Check our Privacy Policy…", destination: URL(string: "https://kc-2001ms.github.io/en/privacy.html")!)
    } button: {
        ContinueButton(color: .accentColor) {
            
        }
    }
    .environment(\.locale, .init(identifier: "ja"))
}
