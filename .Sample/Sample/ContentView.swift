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
    
    @State private var isMajor = true
    
    var body: some View {
        @Bindable var appVersionManager = appVersionManager
        NavigationStack {
            Form {
                Section {
                    Button("Show onboarding sheets") {
                        isOpenSheet.toggle()
                    }
                    .buttonStyle(.borderless)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    NavigationLink("Show onboarding card") {
                        OnboardingCardView()
                    }
                } header: {
                    Text("Onboarding protocol")
                } footer: {
                    Text("This is a simple implementation using the Onboarding protocol")
                }
#if DEBUG
                Section {
                    Button("Initialization") {
                        appVersionManager.lastOpenedVersion = ""
                    }
                    .buttonStyle(.borderless)
                    .foregroundStyle(Color.red)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    
                    Button("After major update") {
                        appVersionManager.lastOpenedVersion = "0.0.0"
                    }
                    .buttonStyle(.borderless)
                    .foregroundStyle(Color.red)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    Button("After minor update") {
                        appVersionManager.lastOpenedVersion = "1.0.0"
                    }
                    .buttonStyle(.borderless)
                    .foregroundStyle(Color.red)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                } header: {
                    Text("AppVersionManager environment variables and customizable views")
                } footer: {
                    Text("This one is implemented with a customizable View and environment variables")
                }
#endif
            }
            .navigationTitle("OnboardingUI")
            .formStyle(.grouped)
        }
        .sheet(isPresented: $appVersionManager.isTheFirstActivation) {
            WelcomeOnboardingSheetView(action: {
                appVersionManager.isTheFirstActivation = false
            })
        }
        .sheet(isPresented: $appVersionManager.isMajorVersionUpdated) {
            NewFeatureOnboardingSheetView(action: {
                appVersionManager.isMajorVersionUpdated = false
            })
        }
        .sheet(isPresented: $appVersionManager.isMinorOrPatchVersionUpdated) {
            NewFeatureOnboardingSheetView(action: {
                appVersionManager.isMinorOrPatchVersionUpdated = false
            })
        }
        .sheetOnboarding(isPresented: $isOpenSheet, WelcomeOnboarding())
    }
}

#Preview {
    ContentView()
}
