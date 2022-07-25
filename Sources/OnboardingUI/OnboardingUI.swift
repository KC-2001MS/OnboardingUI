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
    var color: Color = Color.accentColor
    let action: () -> Void
    public var body: some View {
        Button(action: action) {
            Text("Continue")
                .bold()
                .foregroundColor(.white)
#if os(iOS)
                .frame(minWidth: 0, maxWidth: .infinity)
#elseif os(OSX)
                .frame(minWidth: 0, maxWidth: 130)
#endif
        }
        .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: .accentColor))
        .accessibilityInputLabels(["Continue","Start","Close","Button"])
    }
}
//ボタンスタイル
@available(iOS 14.0,macOS 11,*)
public struct ColorButtonStyle: ButtonStyle {
    var foregroundColor: Color = .white
    var backgroundColor: Color = .accentColor
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


@available(iOS 14.0,macOS 11,*)
struct MyTitle: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
