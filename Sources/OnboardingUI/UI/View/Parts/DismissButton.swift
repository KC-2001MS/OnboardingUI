//
//  DismissButton.swift
//  OnboardingUI
//
//  Created by 茅根 啓介 on 2025/07/30.
//

import SwiftUI

public struct DismissButton<V: View>: View {
    @Environment(\.dismiss) private var dismiss
    
    var label: V
    
    init(@ViewBuilder label: () -> V) {
        self.label = label()
    }
    
    public var body: some View {
        Button {
            dismiss()
        } label: {
            label
        }
    }
}
