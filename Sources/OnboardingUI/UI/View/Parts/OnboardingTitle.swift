//
//  OnboardingTitle.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
public struct OnboardingTitle: View {
    var TextView: Text
    
    public init<S>(_ content: S) where S : StringProtocol {
//        いらないのでは？
//        if content is String {
//            TextView = Text(LocalizedStringKey(content as! String))
//        } else {
        self.TextView = Text(content)
//        }
    }
    
    
    public init(
        _ key: LocalizedStringKey,
        tableName: String? = nil,
        bundle: Bundle? = nil,
        comment: StaticString? = nil
    ){
        self.TextView = Text(key,tableName: tableName,bundle: bundle,comment: comment)
    }
    
    public init(verbatim content: String) {
        self.TextView = Text(verbatim: content)
    }
    
    public init(_ attributedContent: AttributedString) {
        self.TextView = Text(attributedContent)
    }
    
    public init(_ resource: LocalizedStringResource) {
        self.TextView = Text(resource)
    }
    
    public init(_ text: Text) {
        self.TextView = text
    }
    
    public var body: some View {
        TextView
            .onboardingStyle(style: .title)
            .accessibilityLabel(TextView)
    }
}


#Preview("OnboardingTitle") {
    OnboardingTitle("Sample Title")
}
