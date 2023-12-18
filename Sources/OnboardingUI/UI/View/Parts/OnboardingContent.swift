//
//  OnboardingContent.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import SwiftUI

@available(iOS 17.0,macOS 14.0,tvOS 17.0,visionOS 1.0,*)
/// Content to be used for onboarding
public struct OnboardingContent: View {
    /// Text
    var TextView: Text
    /// Initialize with StringProtocol
    /// - Parameter text: Display Contents
    public init<S>(_ content: S) where S : StringProtocol {
        if content is String {
            TextView = Text(LocalizedStringKey(content as! String))
        } else {
            TextView = Text(content)
        }
    }
    /// Creates a text view that displays localized content identified by a key.
    /// - Parameters:
    ///   - key: The key for a string in the table identified by tableName.
    ///   - tableName: The name of the string table to search. If nil, use the table in the Localizable.strings file.
    ///   - bundle: The bundle containing the strings file. If nil, use the main bundle.
    ///   - comment: Contextual information about this key-value pair.
    public init(
        _ key: LocalizedStringKey,
        tableName: String? = nil,
        bundle: Bundle? = nil,
        comment: StaticString? = nil
    ){
        TextView = Text(key,tableName: tableName,bundle: bundle,comment: comment)
    }
    /// Initialize with String
    /// - Parameter text: Display Contents
    public init(verbatim content: String) {
        TextView = Text(verbatim: content)
    }
    /// Initialize with AttributedString
    /// - Parameter text: Display Contents
    public init(_ attributedContent: AttributedString) {
        TextView = Text(attributedContent)
    }
    /// Initialize with LocalizedStringResource
    /// - Parameter text: Display Contents
    public init(_ resource: LocalizedStringResource) {
        TextView = Text(resource)
    }
    /// Initialize with Text
    /// - Parameter text: Display Contents
    public init(_ text: Text) {
        self.TextView = text
    }
    /// View
    public var body: some View {
        TextView
            .onboardingStyle(style: .content)
            .accessibilityLabel(TextView)
    }
}

#Preview("OnboardingItemContent") {
    OnboardingContent("Please check the display of this text")
}
