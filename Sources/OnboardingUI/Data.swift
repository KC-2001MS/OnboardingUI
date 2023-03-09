//
//  File.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import Foundation
import SwiftUI

@available(iOS 14.0,macOS 11,*)
public struct OnboardingItemData: Identifiable {
    public var id = UUID()
    var stringTitle: String
    var stringContent: String
    var localizedTitle: LocalizedStringKey
    var localizedContent: LocalizedStringKey
    var systemName: String
    var color: Color
    
    public init(title: String, content: String, systemName: String,color: Color) {
        self.stringTitle = NSLocalizedString(title, comment: "")
        self.stringContent = NSLocalizedString(content, comment: "")
        self.systemName = systemName
        self.localizedTitle = ""
        self.localizedContent = ""
        self.color = color
    }
    
    public init(title: LocalizedStringKey, content: LocalizedStringKey, systemName: String,color: Color) {
        self.stringTitle = ""
        self.stringContent = ""
        self.systemName = systemName
        self.localizedTitle = title
        self.localizedContent = content
        self.color = color
    }
}

