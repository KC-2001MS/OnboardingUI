//
//  OnboardingView.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/13.
//

import SwiftUI

/// View to display card-type onboarding
@available(iOS 17.0, macOS 14.0, tvOS 17.0, visionOS 1.0, *)
public struct OnboardingCardView<V1: View, V2: View>: View {
    @Binding var isPresented: Bool
    var title: V1
    var content: V2
    
    // Initialize with @ViewBuilder
    public init(
        isPresented: Binding<Bool>,
        @ViewBuilder title: @escaping () -> V1,
        @ViewBuilder content: @escaping () -> V2
    ) {
        self._isPresented = isPresented
        self.title = title()
        self.content = content()
    }
    // Initialize with Onboarding
    public init(
        isPresented: Binding<Bool>,
        onboarding: any Onboarding
    ) where V1 == AnyView, V2 == AnyView {
        self._isPresented = isPresented
        self.title = AnyView(onboarding.title.onboardingTextFormatting(style: .title))
        self.content =
        AnyView(ForEach(onboarding.features) { feature in
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
        })
    }
    
    public var body: some View {
        if isPresented {
            VStack {
                title
                    .padding(.bottom, 30)
                
                VStack(alignment: .leading, spacing: 35) {
                    content
                }
                .frame(maxWidth: .infinity)
                #if os(tvOS)
                .padding(.horizontal, 150)
                #endif
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 50)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(alignment: .topLeading) {
                Button(action: {
                    isPresented.toggle()
                }) {
                    Image(systemName: "multiply")
                }
                .buttonStyle(DismissButtonStyle())
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    @Previewable @State var isPresented = true
    
    ScrollView {
        OnboardingCardView(isPresented: $isPresented, onboarding: PreviewWhatIsNewOnboarding())
            .padding()
    }
}
