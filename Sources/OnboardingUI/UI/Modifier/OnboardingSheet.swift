//
//  SheetOnboarding.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/13.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
struct OnboardingSheet: ViewModifier {
    @Binding public var isPresented: Bool
    
    public let onboarding: any Onboarding
    
    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
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
                                    OnboardingSubtitle(feature.title)
                                    OnboardingContent(message)
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

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
public extension View {
    ///Modifier to display sheets based on Onboarding protocol compliant structures
    func onboardingSheet<Content>(isPresented: Binding<Bool>,_ onboarding: Content) -> some View where Content : Onboarding {
        modifier(OnboardingUI.OnboardingSheet(isPresented: isPresented, onboarding: onboarding))
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = true
    
    Group {
        Button(String("Open Onboarding")) {
            isPresented = true
        }
#if os(macOS)
        .frame(width: 400, height: 300)
#endif
        .onboardingSheet(isPresented: $isPresented, PreviewWhatIsNewOnboarding())
    }
}
