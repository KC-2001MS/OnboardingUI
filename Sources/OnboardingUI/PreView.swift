//
//  PreView.swift
//  Simple Editor X (macOS)
//
//  Created by 茅根啓介 on 2022/04/13.
//

import SwiftUI

//フレームワーク使用例
@available(iOS 14.0,macOS 11,*)
struct FirstLaunchView: View {
    var body: some View {
#if os(OSX)
        VStack {
            Group {
                Spacer()
                    .frame(height: 50)
                OnboardingTitle("Welcome")
                Spacer()
                    .frame(height: 50)
                VStack(alignment: .leading, spacing: 40) {
                    OnboardingItem(systemName: "doc.plaintext",imageColor: .red){
                        ItemTitle("Editing Text")
                        ItemContent("Editing Text Content")
                    }
                    OnboardingItem(systemName: "speaker.wave.3",imageColor: .blue){
                        ItemTitle("Speechreading Function")
                        ItemContent("Speechreading Function Content")
                    }
                    OnboardingItem(systemName: "icloud",imageColor: .orange){
                        ItemTitle("Synchronization of Settings")
                        ItemContent("Synchronization of Settings Content")
                    }
                }
            }
            
            Spacer()
                .frame(height: 70)
            
            ContinueButton(action: {
                
            })
            
            Spacer()
                .frame(height: 30)
        }
#elseif os(iOS)
        GeometryReader { geom in
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: geom.size.height/9.5)
                    OnboardingTitle("Welcome to\nSimple Editor X")
                    Spacer()
                        .frame(height: geom.size.height/14.5)
                    VStack(alignment: .leading, spacing: 40) {
                        OnboardingItem(systemName: "doc.plaintext",imageColor: .red){
                            ItemTitle("Editing Text")
                            ItemContent("Editing Text Content")
                        }
                        OnboardingItem(systemName: "speaker.wave.3",imageColor: .blue){
                            ItemTitle("Speechreading Function")
                            ItemContent("Speechreading Function Content")
                        }
                        OnboardingItem(systemName: "icloud",imageColor: .orange){
                            ItemTitle("Synchronization of Settings")
                            ItemContent("Synchronization of Settings Content")
                        }
                    }
                }
                Spacer()
                ContinueButton(action:{
                    
                })
                Spacer()
                    .frame(height: geom.size.height/14.5)
            }
        }
#endif
    }
}

//うまくいかないフレームワーク実装
@available(iOS 14.0,macOS 11,*)
struct OnboardingView<Title: View,Content: View,Button: View>: View {
    let title: Title
    let content: Content
    let button: Button
    
    init(@ViewBuilder title: () -> Title,
         @ViewBuilder content: () -> Content,
         @ViewBuilder button: () -> Button) {
        self.title = title()
        self.content = content()
        self.button = button()
    }
    
    var body: some View {
#if os(OSX)
        VStack {
            Group {
                Spacer()
                    .frame(height: 50)
                title
                Spacer()
                    .frame(height: 50)
                VStack(alignment: .leading, spacing: 40) {
                    content
                }
            }
            
            Spacer()
                .frame(height: 70)
            
            button
            
            Spacer()
                .frame(height: 30)
        }
#elseif os(iOS)
        GeometryReader { geom in
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: geom.size.height/9.5)
                    title
                    Spacer()
                        .frame(height: geom.size.height/14.5)
                    VStack(alignment: .leading, spacing: 40) {
                        content
                    }
                }
                Spacer()
                button
                Spacer()
                    .frame(height: geom.size.height/14.5)
            }
        }
#endif
    }
}

@available(iOS 14.0,macOS 11,*)
struct FirstLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        FirstLaunchView()
    }
}
