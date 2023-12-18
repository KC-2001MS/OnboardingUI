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
#if os(macOS)
        VStack {
            Spacer()
                .frame(height: 50)
            
            title
            
            Spacer()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    content
                }
            }
            
            Spacer()
            
            button
            
            Spacer()
                .frame(height: 30)
        }
        .frame(maxWidth: 700,minHeight: 500, alignment: .center)
#else
        GeometryReader { geom in
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: geom.size.height/9.5)
                    
                    title
                    
                    Spacer()
                        .frame(height: geom.size.height/14.5)
                    VStack(alignment: .leading, spacing: 40) {
                        content
                    }
                }
                Spacer()
                
                button
                
                Spacer()
                    .frame(height: geom.size.height/14.5)
            }
        }
#if os(visionOS)
        .frame(width: 960,height: 540, alignment: .center)
#endif
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
            HStack {
                Button(action: action) {
                    Image(systemName: "multiply")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(7.5)
                        .frame(width: 30, height: 30)
                }
                .buttonStyle(.borderless)
                .background {
                    Circle()
                        .foregroundColor(.gray.opacity(0.15))
                }
                .clipShape(Circle())
#if !os(macOS)
                .hoverEffect()
#endif
                .padding(10)
                
                Spacer()
            }
            
            title
                .padding(.bottom, 30)
            
            
            //Spacer()
            
            VStack(alignment: .leading) {
                content
            }
            .padding(.bottom, 10)
            
            // Spacer()
            //    .frame(height: 50)
        }
        .frame(maxWidth: .infinity)
        .background(Material.ultraThick)
        .clipShape(RoundedRectangle(cornerRadius: 25))
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
