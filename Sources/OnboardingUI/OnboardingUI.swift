import SwiftUI

//寸法関連
@available(iOS 14.0,macOS 11,*)
public let OnboardingEdgeInsets = EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
//オンボーディング画面タイトル
@available(iOS 14.0,macOS 11,*)
public struct OnboardingTitle: View {
    let text: LocalizedStringKey
    
    init(_ key: LocalizedStringKey){
        text = key
    }
    public var body: some View {
        Text(text)
            .fontWeight(.bold)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .accessibilityLabel(Text(text))
    }
}
//オンボーディング画面項目
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
//項目タイトル
@available(iOS 14.0,macOS 11,*)
public struct ItemTitle: View {
    let text: LocalizedStringKey
    
    init(_ key: LocalizedStringKey){
        text = key
    }
    public var body: some View {
        Text(text)
            .font(.system(size: 15))
            .font(.headline)
            .foregroundColor(.primary)
            .bold()
    }
}
//項目内容
@available(iOS 14.0,macOS 11,*)
public struct ItemContent: View {
    let text: LocalizedStringKey
    
    init(_ key: LocalizedStringKey){
        text = key
    }
    public var body: some View {
        Text(text)
            .font(.system(size: 15))
            .font(.body)
            .lineSpacing(3)
            .foregroundColor(.secondary)
    }
}
//続けるボタン
@available(iOS 14.0,macOS 11,*)
public struct ContinueButton: View {
    let action: () -> Void
    public var body: some View {
        #if os(iOS)
        Button(action: action) {
            Text("Continue")
                .bold()
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding([.top, .bottom], 15)
        .background(Color.accentColor)
        .cornerRadius(15)
        .padding(OnboardingEdgeInsets)
        .accessibilityInputLabels(["Continue","Start","Close","Button"])
        #elseif os(OSX)
        Button(action: action) {
            Text("Continue")
                .bold()
                .foregroundColor(.white)
        }
        .padding()
        #endif
    }
}
