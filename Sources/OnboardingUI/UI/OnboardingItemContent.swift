//
//  OnboardingItemContent.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct OnboardingItemContent: View {
    var TextView: Text
    
    public init<S>(_ content: S) where S : StringProtocol {
        if content is String {
            TextView = Text(LocalizedStringKey(content as! String))
        } else {
            TextView = Text(content)
        }
    }
    
    public init(
        _ key: LocalizedStringKey,
        tableName: String? = nil,
        bundle: Bundle? = nil,
        comment: StaticString? = nil
    ){
        TextView = Text(key,tableName: tableName,bundle: bundle,comment: comment)
    }
    
    public init(verbatim content: String) {
        TextView = Text(verbatim: content)
    }
    public var body: some View {
        TextView
            .onboardingStyle(style: .itemContent)
    }
}

@available(iOS 17.0,macOS 14,visionOS 1,*)
extension OnboardingItemContent {
    public init(_ attributedContent: AttributedString) {
        TextView = Text(attributedContent)
    }
}

@available(iOS 17.0,macOS 14,visionOS 1,*)
extension OnboardingItemContent {
    public init(_ resource: LocalizedStringResource) {
        TextView = Text(resource)
    }
}

#Preview("OnboardingItemContent") {
        OnboardingItemContent("Please check the display of this text")
}
