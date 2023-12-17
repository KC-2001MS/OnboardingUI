//
//  ColorButtonStyle.swift
//  
//  
//  Created by Keisuke Chinone on 2023/12/13.
//


import SwiftUI

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct ColorButtonStyle: ButtonStyle {
    var foregroundColor: Color = .white
    var backgroundColor: Color = .accentColor
    
    public init() {
        self.foregroundColor = .white
        self.backgroundColor = .accentColor
    }
    
    public init(foregroundColor: Color,backgroundColor: Color) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .bold()
#if os(macOS)
            .frame(minWidth: 0, maxWidth: 130)
            .padding([.top, .bottom], 10)
#else
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding([.top, .bottom], 15)
#endif
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
#if os(macOS)
            .clipShape(RoundedRectangle(cornerRadius: 7))
#elseif os(visionOS)
            .clipShape(RoundedRectangle(cornerRadius: 25))
#else
            .clipShape(RoundedRectangle(cornerRadius: 15))

#endif
            .padding(.horizontal, 25)
    }
}

#Preview {
    Button(action: {
        
    }) {
        Text("Sample ColorButtonStyle")
    }
    .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: .red))
}
