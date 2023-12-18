//
//  OnboardingButton.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// Continue button
public struct ContinueButton: View {
    /// Foreground Color
    let foregroundColor: Color
    /// Background Color
    let backgroundColor: Color
    /// Button Action
    let action: () -> Void
    /// Initializer to create default style buttons
    /// - Parameter action: Button Action
    public init(action: @escaping () -> Void){
        self.foregroundColor = .white
        self.backgroundColor = .accentColor
        self.action = action
    }
    /// Initializer that specifies the background color of the button
    /// - Parameters:
    ///   - color: Background Color
    ///   - action: Button Action
    public init(color: Color,action: @escaping () -> Void) {
        self.foregroundColor = .white
        self.backgroundColor = color
        self.action = action
    }
    /// Initializer to create highly customizable buttons
    /// - Parameters:
    ///   - foregroundColor: Foreground Color
    ///   - backgroundColor: Background Color
    ///   - action: Button Action
    public init(
        foregroundColor: Color,
        backgroundColor: Color,
        action: @escaping () -> Void
    ) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.action = action
    }
    /// View
    public var body: some View {
        Button(action: action) {
            Text("Continue", bundle: .module)
        }
#if !os(tvOS)
        .buttonStyle(ColorButtonStyle(foregroundColor: foregroundColor, backgroundColor: backgroundColor))
#endif
        .accessibilityInputLabels(["Continue","Start","Close"])
    }
}

#Preview("Onboarding Button") {
    ContinueButton(color: .accentColor) {
        
    }
}
