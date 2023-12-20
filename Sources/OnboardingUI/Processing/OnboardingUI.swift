import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// View to show onboarding in sheets
public struct OnboardingSheet<V1: View,V2: View,V3: View>: View {
    /// Title View
    var title: V1
    /// View displaying features
    var content: V2
    /// Button view at the bottom
    var button: V3
    /// Initializer for the three Views that make up the OnboardingSheet
    /// - Parameters:
    ///   - title: Title View
    ///   - content: View displaying features
    ///   - button: Button view at the bottom
    public init(
        @ViewBuilder title: () -> V1,
        @ViewBuilder content: () -> V2,
        @ViewBuilder button: () -> V3
    ) {
        self.title = title()
        self.content = content()
        self.button = button()
    }
    /// View
    public var body: some View {
        GeometryReader { geom in
            VStack(alignment: .center) {
                ScrollView {
                    Spacer()
                        .frame(height: geom.size.height/10)
                    
                    title
                    
                    
                    Spacer()
                        .frame(height: geom.size.height/14.5)
                    VStack(alignment: .leading, spacing: 40) {
                        content
                    }
#if os(macOS)
                    .frame(width: 350)
#else
                    .frame(maxWidth: .infinity)
#endif
                }
                Spacer()
                
                button
                
                Spacer()
                    .frame(height: geom.size.height/14.5)
            }
            .frame(maxWidth: .infinity)
        }
#if os(visionOS)
        .frame(width: 960,height: 540, alignment: .center)
#elseif os(macOS)
        .frame(minWidth: 600,minHeight: 700, alignment: .center)
#endif
    }
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// Card-like onboarding
public struct OnboardingCard<V1: View,V2: View>: View {
    /// Title View
    var title: V1
    /// View displaying features
    var content: V2
    /// Button Action
    let action: () -> Void
    /// Title View
    /// - Parameters:
    ///   - title: Title View
    ///   - content: View displaying features
    ///   - action: Button Action
    public init(@ViewBuilder title: () -> V1,
                @ViewBuilder content: () -> V2,
                action: @escaping () -> Void) {
        self.title = title()
        self.content = content()
        self.action = action
    }
    /// View
    public var body: some View {
        VStack {
            Spacer()
                .frame(height: 50)
            
            title
                .padding(.bottom, 30)
            
            VStack(alignment: .leading) {
                content
            }
            .frame(maxWidth: .infinity)
            
            
            Spacer()
                .frame(height: 50)
        }
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay(alignment: .topLeading) {
            Button(action: action) {
                Image(systemName: "multiply")
                    .font(.system(size: 20))
#if os(visionOS)
                    .foregroundStyle(.white)
#else
                    .foregroundStyle(.gray)
#endif
                    .frame(width: 30, height: 30)
#if os(visionOS)
                    .background(.ultraThinMaterial, in: Circle())
#else
                    .background(.gray.opacity(0.15), in: Circle())
#endif
#if !os(macOS)
                    .hoverEffect()
#endif
            }
            .frame(width: 30, height: 30)
            .buttonStyle(.borderless)
            .padding(10)
        }
        .padding()
    }
}

#Preview("Onboarding Sheet") {
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
    } button: {
        ContinueButton(color: .accentColor) {
            
        }
    }
    .environment(\.locale, .init(identifier: "ja"))
}

#Preview("Onboarding Card") {
    ScrollView {
        OnboardingCard {
            OnboardingTitle("Welcome to\nOnboardingUI")
        } content: {
            OnboardingItem(
                systemName: "keyboard",
                shape: .red
            ) {
                OnboardingSubtitle("Easy to Make")
                OnboardingContent("Onboarding screens like Apple's stock apps can be easily created with SwiftUI.")
            }
            
            OnboardingItem(systemName: "macbook.and.ipad") {
                OnboardingSubtitle("Not only for iPhone, but also for Mac and iPad")
                OnboardingContent("It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device.")
            }
            
            OnboardingItem(
                systemName: "macbook.and.iphone",
                mode: .palette,
                primary: .primary,
                secondary: .blue
            ) {
                OnboardingSubtitle("Customize SF Symbols")
                OnboardingContent("It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish.")
            }
        } action: {
            
        }
    }
}
