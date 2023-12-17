//
//  SheetOnboarding.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/13.
//


import SwiftUI

public struct SheetOnboarding: ViewModifier {
    @Binding public var isPresented: Bool
    
    public let onboarding: any Onboarding
    
    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                OnboardingSheet {
                    onboarding.title
                        .onboardingStyle(style: .title)
                } content: {
                    ForEach(onboarding.features) { feature in
                        if let image = feature.image {
                            OnboardingItem {
                                image
                            } content: {
                                if let message = feature.message {
                                    OnboardingSubtitle(feature.title)
                                    OnboardingContent(message)
                                }
                            }

                        }
                    }
                } button: {
                    ContinueButton {
                        isPresented.toggle()
                    }
                }
            }
    }
}

public extension View {
    func sheetOnboarding<Content>(isPresented: Binding<Bool>,_ onboarding: Content) -> some View where Content : Onboarding {
        modifier(OnboardingUI.SheetOnboarding(isPresented: isPresented, onboarding: onboarding))
    }
}

#Preview {
    @State var isPresented: Bool = true

    return Group {
        Button("Open Onboarding") {
            isPresented = true
        }
        #if os(macOS)
        .frame(width: 400, height: 300)
        #endif
        .sheetOnboarding(isPresented: $isPresented, PreviewWhatIsNewOnboarding())
    }
}
