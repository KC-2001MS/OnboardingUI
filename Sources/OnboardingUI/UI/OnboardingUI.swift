import SwiftUI

//寸法関連（完成）
@available(iOS 17.0,macOS 14,visionOS 1,*)
public let OnboardingEdgeInsets = EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct OnboardingSheet<V1: View,V2: View,V3: View>: View {
    var title: V1
    var content: V2
    var button: V3
    
    public init(
        @ViewBuilder title: () -> V1,
        @ViewBuilder content: () -> V2,
        @ViewBuilder button: () -> V3
    ) {
        self.title = title()
        self.content = content()
        self.button = button()
    }
    
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

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct OnboardingCard<V1: View,V2: View>: View {
    var title: V1
    var content: V2
    let action: () -> Void
    
    public init(@ViewBuilder title: () -> V1,
                @ViewBuilder content: () -> V2,
                action: @escaping () -> Void) {
        self.title = title()
        self.content = content()
        self.action = action
    }
    
    public var body: some View {
        VStack {
            HStack {
                Button(action: action) {
                    ZStack(alignment: .center) {
                        Circle()
                            .frame(width: 30)
                            .foregroundColor(.gray.opacity(0.15))
                        
                        Image(systemName: "multiply")
                            .foregroundColor(.gray)
                    }
                }
                .buttonStyle(.borderless)
                .padding(.horizontal)
                
                
                Spacer()
            }
            .frame(height: 50)
            
            title
            
            Spacer()
            
            VStack(alignment: .leading) {
                content
            }
            
            Spacer()
                .frame(height: 50)
        }
        .frame(maxWidth: .infinity)
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
