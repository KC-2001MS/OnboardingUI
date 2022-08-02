import SwiftUI

let userDefaults = UserDefaults.standard
//寸法関連（完成）
@available(iOS 14.0,macOS 11,*)
public let OnboardingEdgeInsets = EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)

//タイトルView（完成）
@available(iOS 14.0,macOS 11,*)
public struct OnboardingTitle: View {
    let localizedText: LocalizedStringKey
    let stringText: String
    init(_ key: LocalizedStringKey){
        self.localizedText = key
        self.stringText = ""
    }
    
    init(_ text: String) {
        self.localizedText = ""
        self.stringText = text
    }
    
    public var body: some View {
        Group {
            if localizedText != "" {
                Text(localizedText)
                    .onboardingStyle(style: .title)
                    .accessibilityLabel(Text(localizedText))
            }
            if stringText != "" {
                Text(stringText)
                    .onboardingStyle(style: .title)
                    .accessibilityLabel(Text(stringText))
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
    
    init(systemName: String,imageColor: Color,@ViewBuilder content: () -> Content) {
        self.content = content()
        self.systemName = systemName
        self.imageColor = imageColor
    }
    
    init(systemName: String,@ViewBuilder content: () -> Content) {
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
        }
        .padding(OnboardingEdgeInsets)
    }
}

//項目タイトルView（完成）
@available(iOS 14.0,macOS 11,*)
public struct ItemTitle: View {
    let localizedText: LocalizedStringKey
    let stringText: String
    
    init(_ key: LocalizedStringKey){
        self.localizedText = key
        self.stringText = ""
    }
    
    init(_ text: String) {
        self.localizedText = ""
        self.stringText = text
    }
    
    public var body: some View {
        Group {
            if localizedText != "" {
                Text(localizedText)
                    .onboardingStyle(style: .itemTitle)
            }
            if stringText != "" {
                Text(stringText)
                    .onboardingStyle(style: .itemTitle)
            }
        }
    }
}

//項目内容View（完成）
@available(iOS 14.0,macOS 11,*)
public struct ItemContent: View {
    let localizedText: LocalizedStringKey
    let stringText: String
    
    init(_ key: LocalizedStringKey){
        self.localizedText = key
        self.stringText = ""
    }
    
    init(_ text: String) {
        self.localizedText = ""
        self.stringText = text
    }
    
    public var body: some View {
        Group {
            if localizedText != "" {
                Text(localizedText)
                    .onboardingStyle(style: .itemContent)
            }
            if stringText != "" {
                Text(stringText)
                    .onboardingStyle(style: .itemContent)
            }
        }
    }
}

//続けるボタンView（完成）
@available(iOS 14.0,macOS 11,*)
public struct OnboardingButton: View {
    var color: Color = Color.accentColor
    var localizedText: LocalizedStringKey
    var stringText: String
    let action: () -> Void
    init(_ text: String,action: @escaping () -> Void){
        self.color = .accentColor
        self.stringText = text
        self.localizedText = ""
        self.action = action
    }
    
    init(color: Color,_ text: String,action: @escaping () -> Void) {
        self.color = color
        self.stringText = text
        self.localizedText = ""
        self.action = action
    }
    
    init(_ key: LocalizedStringKey,action: @escaping () -> Void){
        self.color = .accentColor
        self.stringText = ""
        self.localizedText = key
        self.action = action
    }
    
    init(color: Color,_ key: LocalizedStringKey,action: @escaping () -> Void) {
        self.color = color
        self.stringText = ""
        self.localizedText = key
        self.action = action
    }
    
    
    
    public var body: some View {
        Button(action: action) {
            if localizedText != "" {
                Text(localizedText)
                    .onboardingStyle(style: .button)
            }
            if stringText != "" {
                Text(stringText)
                    .onboardingStyle(style: .button)
            }
        }
        .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: color))
        .accessibilityInputLabels(["Continue","Start","Close","Button"])
    }
}

@available(iOS 14.0,macOS 11,*)
struct OnboardingView: View {
    let title: String
    let content: Array<OnboardingItemData>
    let stringButton: String
    let localizedButton: LocalizedStringKey
    let action: () -> Void
    
    init(title: String,
         content: Array<OnboardingItemData>,
         button: String,
         action: @escaping () -> Void) {
        self.title = title
        self.content = content
        self.stringButton = button
        self.localizedButton = ""
        self.action = action
        
    }
    
    init(title: String,
         content: Array<OnboardingItemData>,
         button: LocalizedStringKey,
         action: @escaping () -> Void) {
        self.title = title
        self.content = content
        self.stringButton = ""
        self.localizedButton = button
        self.action = action
        
    }
    
    var body: some View {
#if os(OSX)
        VStack {
            Group {
                Spacer()
                    .frame(height: 50)
                OnboardingTitle(title)
                Spacer()
                    .frame(height: 50)
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
                .frame(height: 70)
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
#elseif os(iOS)
        GeometryReader { geom in
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: geom.size.height/9.5)
                    OnboardingTitle(title)
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
struct OnboardingItemData: Identifiable {
    var id = UUID()
    var stringTitle: String
    var stringContent: String
    var localizedTitle: LocalizedStringKey
    var localizedContent: LocalizedStringKey
    var systemName: String
    var color: Color
    
    init(title: String, content: String, systemName: String,color: Color) {
        self.stringTitle = title
        self.stringContent = content
        self.systemName = systemName
        self.localizedTitle = ""
        self.localizedContent = ""
        self.color = color
    }
    
    init(title: LocalizedStringKey, content: LocalizedStringKey, systemName: String,color: Color) {
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
    
    init() {
        self.foregroundColor = .white
        self.backgroundColor = .accentColor
    }
    
    init(foregroundColor: Color,backgroundColor: Color) {
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
enum OnboardingStyle {
    case title
    case itemTitle
    case itemContent
    case button
}

//スタイル
@available(iOS 14.0,macOS 11,*)
extension Text {
    func onboardingStyle(style: OnboardingStyle) -> some View {
        Group {
            switch style {
            case .title:
                self
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            case .itemTitle:
                self
                    .font(.system(size: 15))
                    .font(.headline)
                    .foregroundColor(.primary)
                    .bold()
            case .itemContent:
                self
                    .font(.system(size: 15))
                    .font(.body)
                    .lineSpacing(3)
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
final class VersionStateObject: ObservableObject {
    //現在のバージョン
    private var version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    //最後に開いたときのバージョン
    private var lastOpenedVersion: String {
        didSet {
            userDefaults.set(lastOpenedVersion, forKey: "LastOpenedVersion")
        }
    }
    //開いたことがあるか
    @Published var isFirstLaunch: Bool
    //アップデート後開いたことがあるか
    @Published var isFirstLaunchAfterUpdate: Bool
    //初期化
    init() {
        userDefaults.register(defaults:[
            "LastOpenedVersion" : ""
        ])
        lastOpenedVersion = userDefaults.string(forKey: "LastOpenedVersion")!
        isFirstLaunch = lastOpenedVersion == ""
        let lhsComponents = filled(splitByDot(lastOpenedVersion), count: 3)
        let rhsComponents = filled(splitByDot(version), count: 3)
        isFirstLaunchAfterUpdate =
        (lhsComponents[0] < rhsComponents[0] || lhsComponents[1] < rhsComponents[1]) && lastOpenedVersion != ""
    }
    //値の更新
    func opened() {
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
                               content: "Editing Text Content",
                               systemName: "doc.plaintext",
                               color: .red),
            OnboardingItemData(title: "Speechreading Function",
                               content: "Speechreading Function Content",
                               systemName: "speaker.wave.3",
                               color: .blue),
            OnboardingItemData(title: "Synchronization of Settings",
                               content: "Synchronization of Settings Content",
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
            Text("ItemTitle")
                .onboardingStyle(style: .itemTitle)
            Text("ItemContent")
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
