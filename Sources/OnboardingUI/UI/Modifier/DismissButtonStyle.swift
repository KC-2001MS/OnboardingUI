//
//  DismissButtonStyle.swift
//
//  
//  Created by Keisuke Chinone on 2024/01/12.
//


import SwiftUI

/// x Button Style
@available(iOS 17.0,macOS 14.0,visionOS 1.0,*)
public struct DismissButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .frame(width: 30, height: 30)
#if os(visionOS)
            .foregroundStyle(.white)
            .background(.ultraThinMaterial, in: Circle())
#else
            .foregroundStyle(.gray)
            .background(.gray.opacity(0.15), in: Circle())
#endif
#if !os(macOS)
            .hoverEffect()
#endif
            .buttonStyle(.borderless)
            .padding(10)
            .clipShape(Circle())
    }
}

#Preview {
    Button(action: {
        
    }) {
        Image(systemName: "multiply")
    }
    .buttonStyle(DismissButtonStyle())
}
