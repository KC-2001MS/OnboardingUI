//
//  modifier.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public enum OnboardingStyle {
    case title
    case itemTitle
    case itemContent
}

@available(iOS 17.0,macOS 14,visionOS 1,*)
public extension Text {
    func onboardingStyle(style: OnboardingStyle) -> some View {
        Group {
            switch style {
            case .title:
                self
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            case .itemTitle:
                self
                    .font(.system(size: 15))
                    .font(.headline)
                    .foregroundColor(.primary)
                    .bold()
                    .lineLimit(1)
            case .itemContent:
                self
                    .font(.system(size: 15))
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview("Modifier") {
    Group {
        Text("Sample Title")
            .onboardingStyle(style: .title)
    }
}
