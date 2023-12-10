//
//  ContentView.swift
//  Sample
//  
//  Created by Keisuke Chinone on 2023/12/08.
//


import SwiftUI
import OnboardingUI

struct ContentView: View {
    @State private var isOpenSheet = false
    
    @Environment(\.appVersionManager) private var appVersionManager
    
    var body: some View {
        @Bindable var appVersionManager = appVersionManager
        NavigationStack {
            List {
                NavigationLink("Onboarding Card") {
                    OnboardingCardView()
                }
            }
            .navigationTitle("Onboarding Sample App")
        }
        .sheet(isPresented: $appVersionManager.isMajorVersionUpdated) {
            OnboardingSheetView(action: {
                appVersionManager.isMajorVersionUpdated = false
            })
        }
    }
}

#Preview {
    ContentView()
}
