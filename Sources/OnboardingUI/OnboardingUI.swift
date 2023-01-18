import SwiftUI

let userDefaults = UserDefaults.standard
//寸法関連（完成）
@available(iOS 14.0,macOS 11,*)
public let OnboardingEdgeInsets = EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)

//タイトルView（完成）
@available(iOS 14.0,macOS 11,*)
public struct OnboardingTitle: View {
    let localizedStringKey: LocalizedStringKey
    let string: String
    
    public init(_ key: LocalizedStringKey){
        self.localizedStringKey = key
        self.string = ""
    }
    
    public init(_ text: String) {
        self.localizedStringKey = ""
        self.string = NSLocalizedString(text, comment: "")
    }
    
    public var body: some View {
        Group {
            if localizedStringKey != "" {
                Text(localizedStringKey)
                    .onboardingStyle(style: .title)
                    .accessibilityLabel(Text(localizedStringKey))
            }
            if string != "" {
                Text(string)
                    .onboardingStyle(style: .title)
                    .accessibilityLabel(Text(string))
            }
        }
    }
}

//項目タイトルView（完成）
@available(iOS 14.0,macOS 11,*)
public struct ItemTitle: View {
    let localizedStringKey: LocalizedStringKey
    let string: String
    
    public init(_ key: LocalizedStringKey){
        self.localizedStringKey = key
        self.string = ""
    }
    
    public init(_ text: String) {
        self.localizedStringKey = ""
        self.string = NSLocalizedString(text, comment: "")
    }
    
    
    public var body: some View {
        Group {
            if localizedStringKey != "" {
                Text(localizedStringKey)
                    .onboardingStyle(style: .itemTitle)
            }
            if string != "" {
                Text(string)
                    .onboardingStyle(style: .itemTitle)
            }
        }
    }
}

//項目View（完成）
@available(iOS 14.0,macOS 11,*)
public struct OnboardingItem<Content: View>: View {
    let content: Content
    let systemName: String
    let imageColor: Color
    
    public init(systemName: String,imageColor: Color,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.imageColor = imageColor
    }
    
    public init(systemName: String,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.imageColor = Color.accentColor
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(5)
                .font(.largeTitle)
                .foregroundColor(imageColor)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 5) {
                content
            }
            .frame(maxHeight: .infinity)
        }
        .padding(OnboardingEdgeInsets)
    }
}

//項目内容View（完成）
@available(iOS 14.0,macOS 11,*)
public struct ItemContent: View {
    let localizedStringKey: LocalizedStringKey
    let string: String
    
    public init(_ key: LocalizedStringKey){
        self.localizedStringKey = key
        self.string = ""
    }
    
    public init(_ text: String) {
        self.localizedStringKey = ""
        self.string = NSLocalizedString(text, comment: "")
    }
    
    
    public var body: some View {
        Group {
            if localizedStringKey != "" {
                Text(localizedStringKey)
                    .onboardingStyle(style: .itemContent)
            }
            if string != "" {
                Text(string)
                    .onboardingStyle(style: .itemContent)
            }
        }
    }
}

//続けるボタンView（完成）
@available(iOS 14.0,macOS 11,*)
public struct OnboardingButton: View {
    var color: Color = Color.accentColor
    var localizedStringKey: LocalizedStringKey
    let string: String
    let action: () -> Void
    public init(_ text: String,action: @escaping () -> Void){
        self.color = .accentColor
        self.string = NSLocalizedString(text, comment: "")
        self.localizedStringKey = ""
        self.action = action
    }
    
    public init(color: Color,_ text: String,action: @escaping () -> Void) {
        self.color = color
        self.string = NSLocalizedString(text, comment: "")
        self.localizedStringKey = ""
        self.action = action
    }
    
    public init(_ key: LocalizedStringKey,action: @escaping () -> Void){
        self.color = .accentColor
        self.string = ""
        self.localizedStringKey = key
        self.action = action
    }
    
    public init(color: Color,_ key: LocalizedStringKey,action: @escaping () -> Void) {
        self.color = color
        self.string = ""
        self.localizedStringKey = key
        self.action = action
    }
    
    
    
    public var body: some View {
        Button(action: action) {
            if localizedStringKey != "" {
                Text(localizedStringKey)
                    .onboardingStyle(style: .button)
            }
            if string != "" {
                Text(string)
                    .onboardingStyle(style: .button)
            }
        }
        .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: color))
        .accessibilityInputLabels(["Continue","Start","Close","Button"])
    }
}

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
                ForEach(content) { content in
                    if content.stringTitle != "" && content.stringContent != "" {
                        OnboardingItem(systemName: content.systemName,
                                       imageColor: content.color){
                            ItemTitle(content.stringTitle)
                            ItemContent(content.stringContent)
                        }
                    }
                    if content.localizedTitle != "" && content.localizedContent != "" {
                        OnboardingItem(systemName: content.systemName,
                                       imageColor: content.color){
                            ItemTitle(content.localizedTitle)
                            ItemContent(content.localizedContent)
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
        .frame(maxWidth: 700, maxHeight: .infinity, alignment: .center)
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
                                               imageColor: content.color){
                                    ItemTitle(content.stringTitle)
                                    ItemContent(content.stringContent)
                                }
                            }
                            if content.localizedTitle != "" && content.localizedContent != "" {
                                OnboardingItem(systemName: content.systemName,
                                               imageColor: content.color){
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

@available(iOS 14.0,macOS 11,*)
public struct OnboardingItemData: Identifiable {
    public var id = UUID()
    var stringTitle: String
    var stringContent: String
    var localizedTitle: LocalizedStringKey
    var localizedContent: LocalizedStringKey
    var systemName: String
    var color: Color
    
    public init(title: String, content: String, systemName: String,color: Color) {
        self.stringTitle = NSLocalizedString(title, comment: "")
        self.stringContent = NSLocalizedString(content, comment: "")
        self.systemName = systemName
        self.localizedTitle = ""
        self.localizedContent = ""
        self.color = color
    }
    
    public init(title: LocalizedStringKey, content: LocalizedStringKey, systemName: String,color: Color) {
        self.stringTitle = ""
        self.stringContent = ""
        self.systemName = systemName
        self.localizedTitle = title
        self.localizedContent = content
        self.color = color
    }
}

//ボタンスタイル（完成）
@available(iOS 14.0,macOS 11,*)
public struct ColorButtonStyle: ButtonStyle {
    var foregroundColor: Color = .white
    var backgroundColor: Color = .accentColor
    
    public init() {
        self.foregroundColor = .white
        self.backgroundColor = .accentColor
    }
    
    public init(foregroundColor: Color,backgroundColor: Color) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
#if os(iOS)
            .padding([.top, .bottom], 15)
#elseif os(OSX)
            .padding([.top, .bottom], 10)
#endif
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
#if os(iOS)
            .cornerRadius(15)
            .padding(OnboardingEdgeInsets)
#elseif os(OSX)
            .cornerRadius(7)
            .padding(OnboardingEdgeInsets)
#endif
    }
}

//列挙型(スタイル指定用)
public enum OnboardingStyle {
    case title
    case itemTitle
    case itemContent
    case button
}

//スタイル
@available(iOS 14.0,macOS 11,*)
public extension Text {
    func onboardingStyle(style: OnboardingStyle) -> some View {
        Group {
            switch style {
            case .title:
                self
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            case .itemTitle:
                self
                    .font(.system(size: 15))
                    .font(.headline)
                    .foregroundColor(.primary)
                    .bold()
                    .lineLimit(1)
            case .itemContent:
                self
                    .font(.system(size: 15))
                    .font(.body)
                    .foregroundColor(.secondary)
            case .button:
                self
                    .bold()
                    .foregroundColor(.white)
#if os(iOS)
                    .frame(minWidth: 0, maxWidth: .infinity)
#elseif os(OSX)
                    .frame(minWidth: 0, maxWidth: 130)
#endif
            }
        }
    }
}

//初期画面実装
@available(iOS 14.0,macOS 11,*)
public class VersionStateObject: ObservableObject {
    //現在のバージョン
    public var version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    //最後に開いたときのバージョン
    public var lastOpenedVersion: String {
        didSet {
            userDefaults.set(lastOpenedVersion, forKey: "LastOpenedVersion")
        }
    }
    
    //開いたことがあるか
    @Published public var isFirstLaunch: Bool
    //アップデート後開いたことがあるか
    @Published public var isFirstLaunchAfterUpdate: Bool
    //初期化
    public init() {
        userDefaults.register(defaults:[
            "LastOpenedVersion" : ""
        ])
        lastOpenedVersion = userDefaults.string(forKey: "LastOpenedVersion")!
        isFirstLaunch = lastOpenedVersion == ""
        let lhsComponents = filled(splitByDot(lastOpenedVersion), count: 3)
        let rhsComponents = filled(splitByDot(version), count: 3)
        isFirstLaunchAfterUpdate =
        (lhsComponents[0] != rhsComponents[0] || lhsComponents[1] != rhsComponents[1]) && lastOpenedVersion != ""
    }
    //値の更新
    public func opened() {
        lastOpenedVersion = version
    }
}
//バージョン番号をドットで分けて配列化
func splitByDot(_ versionNumber: String) -> [Int] {
    return versionNumber.split(separator: ".").map { string -> Int in
        return Int(string) ?? 0
    }
}
//配列の要素数を統一
func filled(_ target: [Int], count: Int) -> [Int] {
    return (0..<count).map { i -> Int in
        (i < target.count) ? target[i] : 0
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
        
        OnboardingTitle("Onboarding Title")
        
        OnboardingItem(systemName: "doc") {
            ItemTitle("ItemTitle")
            ItemContent("ItemContent")
        }
        
        OnboardingButton(color: .accentColor,"Continue"){
            
        }
        
        Text("Onboarding Title")
            .onboardingStyle(style: .title)
        
        OnboardingItem(systemName: "doc",imageColor: .red) {
            Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                .onboardingStyle(style: .itemTitle)
            Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
                .onboardingStyle(style: .itemContent)
        }
        
        
        Button(action: {
            
        }) {
            Text("Continue")
                .onboardingStyle(style: .button)
        }
        .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: .red))
        
        OnboardingView(title: "Welcome to\nSimple Editor X",
                       content: content,
                       button: "Continue",
                       action: {
            
        })
    }
}
