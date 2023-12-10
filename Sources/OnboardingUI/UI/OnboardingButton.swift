//
//  OnboardingButton.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct OnboardingButton: View {
    var color: Color = Color.accentColor
    var localizedStringKey: LocalizedStringKey
    let string: String
    let action: () -> Void
    
    public init(_ text: String,action: @escaping () -> Void){
        self.color = .accentColor
        self.string = NSLocalizedString(text, comment: "")
        self.localizedStringKey = ""
        self.action = action
    }
    
    public init(color: Color,_ text: String,action: @escaping () -> Void) {
        self.color = color
        self.string = NSLocalizedString(text, comment: "")
        self.localizedStringKey = ""
        self.action = action
    }
    
    public init(_ key: LocalizedStringKey,action: @escaping () -> Void){
        self.color = .accentColor
        self.string = ""
        self.localizedStringKey = key
        self.action = action
    }
    
    public init(color: Color,_ key: LocalizedStringKey,action: @escaping () -> Void) {
        self.color = color
        self.string = ""
        self.localizedStringKey = key
        self.action = action
    }
    
    
    
    public var body: some View {
        Button(action: action) {
            if localizedStringKey != "" {
                Text(localizedStringKey)
                    .onboardingStyle(style: .button)
            }
            if string != "" {
                Text(string)
                    .onboardingStyle(style: .button)
            }
        }
        .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: color))
        .accessibilityInputLabels(["Continue","Start","Close","Button"])
    }
}

#Preview("Onboarding Button") {
    OnboardingButton(color: .accentColor,"Continue"){
        
    }
}
