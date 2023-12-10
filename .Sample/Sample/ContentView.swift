//
//  ContentView.swift
//  Sample
//  
//  Created by Keisuke Chinone on 2023/12/08.
//


import SwiftUI

struct ContentView: View {
    @State private var isOpenSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                Button(action: {
                    isOpenSheet.toggle()
                }) {
                    Text("Onboarding Sheet")
                }
                NavigationLink("Onboarding Card") {
                    OnboardingCardView()
                }
            }
            .navigationTitle("Onboarding Sample App")
        }
        .sheet(isPresented: $isOpenSheet) {
            OnboardingSheetView()
        }
    }
}

#Preview {
    ContentView()
}
