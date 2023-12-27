//
//  ColorButtonStyle.swift
//  
//  
//  Created by Keisuke Chinone on 2023/12/13.
//

import SwiftUI

/// Modifier to build the look and feel of buttons that continue to be used in onboarding
@available(iOS 17.0,macOS 14.0,visionOS 1.0,*)
public struct ColorButtonStyle: ButtonStyle {
    /// Foreground Color
    var foregroundColor: Color = .white
    /// Background Color
    var backgroundColor: Color = .accentColor
    /// Default initializer
    public init() {
        self.foregroundColor = .white
        self.backgroundColor = .accentColor
    }
    /// Initializer used to specify color
    /// - Parameters:
    ///   - foregroundColor: Foreground Color
    ///   - backgroundColor: Background Color
    public init(foregroundColor: Color,backgroundColor: Color) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    /// Button Looks
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .lineLimit(1)
            .bold()
#if os(macOS)
            .frame(minWidth: 0, maxWidth: 170)
            .padding([.top, .bottom], 7.5)
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 7))
#elseif os(visionOS)
            .frame(minWidth: 0, maxWidth: 275)
            .padding([.top, .bottom], 15)
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 35))
#else
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding([.top, .bottom], 15)
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 15))
#endif
            .foregroundColor(foregroundColor)
            .padding(.horizontal, 40)
    }
}

#Preview {
    Button(action: {
        
    }) {
        Text(String("Sample ColorButtonStyle"))
    }
    .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: .red))
}
