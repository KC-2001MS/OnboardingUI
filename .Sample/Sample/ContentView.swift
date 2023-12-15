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
            Form {
                Section {
                    NavigationLink("Show onboarding card") {
                        OnboardingCardView()
                    }
                    
                    Button("Show onboarding sheets") {
                        isOpenSheet.toggle()
                    }
                    .buttonStyle(.borderless)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                } header: {
                    Text("Onboarding protocol")
                }
                #if DEBUG
                Section {
                    Button("Change to initial startup state") {
                        appVersionManager.lastOpenedVersion = ""
                    }
                    .buttonStyle(.borderless)
                    .foregroundStyle(Color.red)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    
                    Button("Changed to first startup status after update") {
                        appVersionManager.lastOpenedVersion = "0.0.0"
                    }
                    .buttonStyle(.borderless)
                    .foregroundStyle(Color.red)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    Button("Changed to first startup status after update") {
                        appVersionManager.lastOpenedVersion = "1.0.0"
                    }
                    .buttonStyle(.borderless)
                    .foregroundStyle(Color.red)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                } header: {
                    Text("AppVersionManager")
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
