import SwiftUI

//寸法関連（完成）
@available(iOS 14.0,macOS 11,*)
public let OnboardingEdgeInsets = EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)

@available(iOS 14.0,macOS 11,*)
public struct OnboardingSheet<V1: View,V2: View,V3: View>: View {
    let title: V1
    let content: V2
    let button: V3
    
    public init(title: V1,
                @ViewBuilder content: () -> V2,
                button: V3) {
        self.title = title
        self.content = content()
        self.button = button
    }
    
    public var body: some View {
#if os(OSX)
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
#elseif os(iOS)
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
#endif
    }
}

//表示確認
@available(iOS 14.0,macOS 11,*)
struct OnboardingView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        OnboardingSheet(
            title: OnboardingTitle("Welcome to\nOnboardingUI"),
            content: {
                OnboardingItem(systemName: "keyboard",color: .red) {
                    OnboardingItemTitle("Easy to Make")
                    OnboardingItemContent("Onboarding screens like Apple's stock apps can be easily created with SwiftUI.")
                }
                
                OnboardingItem(systemName: "macbook.and.ipad") {
                    OnboardingItemTitle("Not only for iPhone, but also for Mac and iPad")
                    OnboardingItemContent("It supports not only iPhone, but also Mac and iPad. Therefore, there is no need to rewrite the code for each device.")
                }
                
                if #available(macOS 12,iOS 15, *) {
                    OnboardingItemParts(systemName: "macbook.and.iphone",mode: .palette,primary: .primary,secondary: .blue) {
                        OnboardingItemTitle("Customize SF Symbols")
                        OnboardingItemContent("It supports multi-colors and hierarchies supported by iOS 15 and macOS 12, so you can customize it as you wish.")
                    }
                }
            },
            button: OnboardingButton("Continue", action: {
                
            })
        )
    }
}
