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
    
    @State private var isOpeningPhotos = false
    
    @State private var isOpeningXcode = false
    
    @State private var isOpeningFreeform = false
    
    var body: some View {
        @Bindable var appVersionManager = appVersionManager
        NavigationStack {
            Form {
                Section {
                    Button("Show onboarding sheets") {
                        isOpenSheet.toggle()
                    }
#if !os(tvOS)
                    .buttonStyle(.borderless)
#endif
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    NavigationLink("Show onboarding card") {
                        NewFeatureOnboardingCardView()
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
#if !os(tvOS)
                    .buttonStyle(.borderless)
#endif
                    .foregroundStyle(Color.red)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    
                    Button("After major update") {
                        appVersionManager.lastOpenedVersion = "0.0.0"
                    }
#if !os(tvOS)
                    .buttonStyle(.borderless)
#endif
                    .foregroundStyle(Color.red)
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    Button("After minor update") {
                        appVersionManager.lastOpenedVersion = "1.0.0"
                    }
#if !os(tvOS)
                    .buttonStyle(.borderless)
#endif
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
                Section {
                    Button("Photos") {
                        isOpeningPhotos.toggle()
                    }
#if !os(tvOS)
                    .buttonStyle(.borderless)
#endif
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    Button("Xcode") {
                        isOpeningXcode.toggle()
                    }
#if !os(tvOS)
                    .buttonStyle(.borderless)
#endif
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                    Button("Freeform") {
                        isOpeningFreeform.toggle()
                    }
#if !os(tvOS)
                    .buttonStyle(.borderless)
#endif
#if os(macOS)
                    .frame(maxWidth: .infinity, alignment: .center)
#endif
                } header: {
                    Text("Imitation of Apple stock apps")
                }
            }
            .navigationTitle("OnboardingUI")
            .formStyle(.grouped)
        }
        .sheet(isPresented: $appVersionManager.isTheFirstLaunch) {
            WelcomeOnboardingSheetView(action: {
                appVersionManager.isTheFirstLaunch = false
            })
        }
        .sheet(isPresented: $appVersionManager.isMajorVersionUpdated) {
            NewFeatureOnboardingSheetView(action: {
                appVersionManager.isMajorVersionUpdated = false
            })
        }
        .sheet(isPresented: $appVersionManager.isMajorOrMinorVersionUpdated) {
            NewFeatureOnboardingSheetView(action: {
                appVersionManager.isMajorOrMinorVersionUpdated = false
            })
        }
        .onboardingSheet(isPresented: $isOpenSheet, WelcomeOnboarding())
        .onboardingSheet(isPresented: $isOpeningPhotos, PhotosFakeOnboarding())
        .onboardingSheet(isPresented: $isOpeningXcode, XcodeFakeOnboarding())
        .onboardingSheet(isPresented: $isOpeningFreeform, FreeformFakeOnboarding())
    }
}

#Preview {
    ContentView()
}
