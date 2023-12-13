//
//  OnboardingButton.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct ContinueButton: View {
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
        
    public init(action: @escaping () -> Void){
        self.foregroundColor = .white
        self.backgroundColor = .accentColor
        self.action = action
    }
    
    public init(color: Color,action: @escaping () -> Void) {
        self.foregroundColor = .white
        self.backgroundColor = color
        self.action = action
    }
    
    public init(
        foregroundColor: Color,
        backgroundColor: Color,
        action: @escaping () -> Void
    ) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text("Continue", bundle: .module)
        }
        .buttonStyle(ColorButtonStyle(foregroundColor: foregroundColor, backgroundColor: backgroundColor))
        .accessibilityInputLabels(["Continue","Start","Close"])
    }
}

#Preview("Onboarding Button") {
    ContinueButton(color: .accentColor) {
        
    }
}
