//
//  OnboardingSheetView.swift
//
//
//  Created by Keisuke Chinone on 2023/12/25.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// View to show onboarding in sheets
public struct OnboardingSheetView<V1: View,V2: View,V3: View,V4: View>: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    /// Title View
    var title: V1
    /// View displaying features
    var content: V2
    /// Link View
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
                                .padding(.horizontal, 10)
                                .padding(.vertical, geom.size.height / 20)
                        }
#if !os(tvOS)
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
#else
                        LazyVGrid(columns: Array(repeating: .init(.flexible()),
                                                 count: 2), spacing: 100) {
                            content
                        }
                        .padding(.horizontal, 50)
#endif
                        
                        VStack {
                            if dynamicTypeSize > .xxxLarge {
                                link
#if os(macOS)
                                    .padding(30)
#else
                                    .padding(.vertical, 5)
#endif
                                
                                button
#if os(iOS)
                                    .padding(.top, 10)
                                    .padding(.bottom, 70 - geom.size.height/15 + geom.size.height/20)
#elseif os(visionOS)
                                    .padding(.bottom, geom.size.height/25)
#elseif os(macOS)
                                    .padding(.bottom, 15 + geom.size.height/20)
#else
                                    .padding(.bottom, geom.size.height/20)
#endif
                            }
                        }
                    }
#if os(visionOS)
                    .padding(.top, geom.size.height/25)
#else
                    .padding(.top, geom.size.height/20)
#endif
                }
                
                if dynamicTypeSize <= .xxxLarge {
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
                        .padding(.bottom, 70 - geom.size.height/15 + geom.size.height/20)
#elseif os(visionOS)
                        .padding(.bottom, geom.size.height/25)
#elseif os(macOS)
                        .padding(.bottom, 15 + geom.size.height/20)
#else
                        .padding(.bottom, geom.size.height/20)
#endif
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
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
    OnboardingSheetView {
        OnboardingTitle(String("Welcome to\nOnboardingUI"))
    } content: {
        OnboardingItem(systemName: "keyboard",shape: .red) {
            OnboardingSubtitle(String("Easy to Make"))
            OnboardingContent(String("Onboarding screens like Apple's stock apps can be easily created with SwiftUI."))
        }
        
        OnboardingItem(systemName: "macbook.and.ipad") {
            OnboardingSubtitle(String("Not only for iPhone, but also for Mac and iPad"))
            OnboardingContent(String("It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device."))
        }
        
        OnboardingItem(systemName: "macbook.and.iphone",mode: .palette,primary: .primary,secondary: .blue) {
            OnboardingSubtitle(String("Customize SF Symbols"))
            OnboardingContent(String("It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish."))
        }
        
#if os(tvOS)
        OnboardingItem(systemName: "ellipsis",shape: .white) {
            OnboardingSubtitle(String("Many other benefits"))
            OnboardingContent(String("Now, tvOS is also supported, making it easy to create onboarding. Now you can create onboarding for all platforms except watchOS."))
        }
#endif
    } link: {
        Link(String("Check our Privacy Policy…"), destination: URL(string: "https://kc-2001ms.github.io/en/privacy.html")!)
    } button: {
        ContinueButton(color: .accentColor) {
            
        }
    }
}
