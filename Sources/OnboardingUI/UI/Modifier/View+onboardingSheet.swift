//
//  SheetOnboarding.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/13.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
struct OnboardingSheet<O: Onboarding>: ViewModifier {
    @Binding public var isPresented: Bool
    
    public let onboarding: O
    
    init(isPresented: Binding<Bool>, onboarding: O) {
        self._isPresented = isPresented
        self.onboarding = onboarding
    }
    
    public func body(content: Content) -> some View {
        content
//            .fullScreenCover(isPresented: <#T##Binding<Bool>#>) {
//                
//            }
            .sheet(isPresented: $isPresented) {
                if #available(iOS 18.0,macOS 15.0,tvOS 18.0,visionOS 2.0,*) {
                    OnboardingView(onboarding: onboarding)
                } else {
                    OnboardingSheetView {
                        onboarding.title
                            .onboardingTextFormatting(style: .title)
                    } content: {
                        ForEach(onboarding.features) { feature in
                            if let image = feature.image {
                                OnboardingItem {
                                    image
                                } content: {
                                    if let message = feature.message {
                                        feature.title
                                            .onboardingTextFormatting(style: .subtitle)
                                        message
                                            .onboardingTextFormatting(style: .content)
                                    }
                                }
                    
                            }
                        }
                    } link: {
                        onboarding.link
                    } button: {
                        ContinueButton {
                            isPresented.toggle()
                        }
                    }
                }
            }
    }
}

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
@available(watchOS, unavailable)
public extension View {
    ///Modifier to display sheets based on Onboarding protocol compliant structures
    func onboardingSheet<Content>(isPresented: Binding<Bool>,_ onboarding: Content) -> some View where Content : Onboarding {
        modifier(
            OnboardingUI
                .OnboardingSheet(
                    isPresented: isPresented,
                    onboarding: onboarding
                )
        )
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = true
    
    if #available(iOS 26, macOS 26, tvOS 26, visionOS 26, *) {
        Button(String("Open Onboarding")) {
            isPresented = true
        }
#if os(macOS)
        .frame(width: 400, height: 300)
#endif
        .onboardingSheet(isPresented: $isPresented, PreviewWhatIsNewOnboarding())
        .onboardingViewStyle(.automatic)
    }

}
