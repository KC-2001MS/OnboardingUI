import SwiftUI

//寸法関連（完成）
@available(iOS 14.0,macOS 11,*)
public let OnboardingEdgeInsets = EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)

@available(iOS 14.0,macOS 11,*)
public struct OnboardingView: View {
    let stringTitle: String
    let localizedTitle: LocalizedStringKey
    let content: Array<OnboardingItemData>
    let stringButton: String
    let localizedButton: LocalizedStringKey
    let action: () -> Void
    
    public init(title: String,
                content: Array<OnboardingItemData>,
                button: String,
                action: @escaping () -> Void) {
        self.stringTitle = NSLocalizedString(title, comment: "")
        self.localizedTitle = ""
        self.content = content
        self.stringButton = button
        self.localizedButton = ""
        self.action = action
    }
    
    public init(title: LocalizedStringKey,
                content: Array<OnboardingItemData>,
                button: LocalizedStringKey,
                action: @escaping () -> Void) {
        self.stringTitle = ""
        self.localizedTitle = title
        self.content = content
        self.stringButton = ""
        self.localizedButton = button
        self.action = action
    }
    
    public var body: some View {
#if os(OSX)
        VStack {
            Spacer()
                .frame(height: 50)
            
            Group {
                if localizedTitle != "" {
                    OnboardingTitle(localizedTitle)
                }
                if stringTitle != "" {
                    OnboardingTitle(stringTitle)
                }
            }
            
            Spacer()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    ForEach(content) { content in
                        if content.stringTitle != "" && content.stringContent != "" {
                            OnboardingItem(systemName: content.systemName,
                                           color: content.color){
                                OnboardingItemTitle(content.stringTitle)
                                OnboardingItemContent(content.stringContent)
                            }
                        }
                        if content.localizedTitle != "" && content.localizedContent != "" {
                            OnboardingItem(systemName: content.systemName,
                                           color: content.color){
                                OnboardingItemTitle(content.localizedTitle)
                                OnboardingItemContent(content.localizedContent)
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            
            Group {
                if localizedButton != "" {
                    OnboardingButton(localizedButton,action: action)
                }
                if stringButton != "" {
                    OnboardingButton(stringButton,action: action)
                }
            }
            
            Spacer()
                .frame(height: 30)
        }
        .frame(width: 700)
        .frame(minHeight: 500,maxHeight: .infinity, alignment: .center)
#elseif os(iOS)
        GeometryReader { geom in
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: geom.size.height/9.5)
                    if localizedTitle != "" {
                        OnboardingTitle(localizedTitle)
                    }
                    if stringTitle != "" {
                        OnboardingTitle(stringTitle)
                    }
                    Spacer()
                        .frame(height: geom.size.height/14.5)
                    VStack(alignment: .leading, spacing: 40) {
                        ForEach(content) { content in
                            if content.stringTitle != "" && content.stringContent != "" {
                                OnboardingItem(systemName: content.systemName,
                                               color: content.color){
                                    ItemTitle(content.stringTitle)
                                    ItemContent(content.stringContent)
                                }
                            }
                            if content.localizedTitle != "" && content.localizedContent != "" {
                                OnboardingItem(systemName: content.systemName,
                                               color: content.color){
                                    ItemTitle(content.localizedTitle)
                                    ItemContent(content.localizedContent)
                                }
                            }
                        }
                    }
                }
                Spacer()
                Group {
                    if localizedButton != "" {
                        OnboardingButton(localizedButton,action: action)
                    }
                    if stringButton != "" {
                        OnboardingButton(stringButton,action: action)
                    }
                }
                Spacer()
                    .frame(height: geom.size.height/14.5)
            }
        }
#endif
    }
}

//表示確認
@available(iOS 14.0,macOS 11,*)
struct OnboardingView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        let content = [
            OnboardingItemData(title: "Editing Text",
                               content: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                               systemName: "doc.plaintext",
                               color: .red),
            OnboardingItemData(title: "Speechreading Function",
                               content: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                               systemName: "speaker.wave.3",
                               color: .blue),
            OnboardingItemData(title: "Synchronization of Settings",
                               content: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                               systemName: "icloud",
                               color: .orange)
        ]
        
        
        OnboardingView(title: "Welcome to\nSimple Editor X",
                       content: content,
                       button: "Continue",
                       action: {
            
        })
    }
}
