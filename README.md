# OnboardingUI

SwiftUI library to implement first-party app-like onboarding  
Apple純正アプリのようなオンボーディングを実装できるSwiftUIライブラリ  

## Description(概要)

This library allows you to implement onboarding designs as implemented in first-party apps in your own apps.
Since the library is made by SwiftUI, you can implement onboarding with fewer lines. It is ideal for introducing new features or displaying at first launch.  
このライブラリではAppleの純正アプリで実装されているようなオンボーディングのデザインを自身のアプリに実装できるライブラリです。
SwiftUI製のライブラリなので、より少ない行数でオンボーディングを実装できます。新機能の紹介や初回起動時の表示に最適です。  

## Demo(概要)

The following can be implemented for onboarding  
以下のような、オンボーディングを実装することができます。  
### macOS
![macOS](images/macOS_Preview.png "macOS Preview")
### iPadOS
![iPadOS](images/iPadOS_Preview.png "iPadOS Preview")
### iOS
![iOS](images/iOS_Preview.png "iOS Preview")  

## Requirement(必要条件)

The following environment is required to use this library.  
このライブラリを使用するには以下の環境が必要です。  
- iOS 14.0+ / iPadOS 14.0+ / macOS 11+ /
- Xcode 12.0+
- Swift 5.1+

※　watchOS and tvOS are not supported. The reason is that I do not own hardware that runs these two operating systems. If you want to support these OS, please send me a pull request.  
※　watchOSおよびtvOSには対応しません。理由は、私がこの二つのOSが動くハードを所有していないからです。私のモチベーションとみなさまのご協力によっては、実装されるかも知れませんので、これらでの対応をお望みでしたら、プルリクエストをお願いいたします。  
## Usage(使い方)
### Display on-boarding titles (オンボーディングのタイトル表示する)
```swift
        OnboardingTitle("Onboarding Title")
```
or
```swift
        Text("Onboarding Title")
            .onboardingStyle(style: .title)
``` 
Below is the result of this execution.  
下はこの実行結果です。  
#### iOS版
![iOS版](images/iOS_OnboardingTitle.png "Onboarding Title")  
#### macOS版
![macOS版](images/macOS_OnboardingTitle.png "Onboarding Title")  

### Display the text of the title of the onboarding item (オンボーディングの項目のタイトルのテキストを表示する)
以下のように、二つの方法で簡単にオンボーディングの項目のタイトルを作成することができます。  
```swift
        ItemTitle("ItemTitle")
```
or
```swift
        Text("ItemTitle")
            .onboardingStyle(style: .itemTitle)
```

### オンボーディングの項目内のテキストを表示する
以下のように、二つの方法で簡単にオンボーディングの項目内のテキストを作成することができます。  
```swift
        ItemContent("ItemContent")
```
or
```swift
        Text("ItemContent")
                .onboardingStyle(style: .itemContent)
```

### オンボーディングの項目を作成する
```swift
        OnboardingItem(systemName: "doc",imageColor: .red) {
            ItemTitle("ItemTitle")
            ItemContent("ItemContent")
        }
```
or
```swift
        OnboardingItem(systemName: "doc",imageColor: .red) {
            Text("ItemTitle")
                .onboardingStyle(style: .itemTitle)
            Text("ItemContent")
                .onboardingStyle(style: .itemContent)
        }
```
Below is the result of this execution.  
下はこの実行結果です。  
(imageColorはオプションで省略可能です。)  
#### iOS版
![iOS版](images/iOS_OnboardingItem.png "Onboarding Item")  
#### macOS版
![macOS版](images/macOS_OnboardingItem.png "Onboarding Item")  

### オンボーディングのボタンを作成する
```swift
        ContinueButton(color: .red){
            
        }
```
or
```swift
        Button(action: {
            
        }) {
            Text("Continue")
                .onboardingStyle(style: .button)
        }
        .buttonStyle(ColorButtonStyle(foregroundColor: .white, backgroundColor: .red))
```
Below is the result of this execution.  
下はこの実行結果です。  
(color/foregroundColor/backgroundColorは省略可能でデフォルトはそれぞれ.blue/.white/.redとなります。)  
#### iOS版
![iOS版](images/iOS_ContinueButton.png "Continue Button")  
#### macOS版
![macOS版](images/macOS_ContinueButton.png "Continue Button")  
## Install (インストール)

Xcode is required to use this library.
However, it is currently under development and cannot be installed. We will let you know as soon as possible.  

このライブラリを使うには、Xcodeが必要です。
ただ、現在開発中のため、インストールはできません。追ってお知らせします。

## Contribution(貢献)

1. Fork it
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create new Pull Request

1. フォークする
2. あなたの機能ブランチを作成する
3. 変更をコミットする
4. ブランチにプッシュする
5. 新しいプルリクエストを作成する

## Licence (ライセンス)

[OnboardingUI](https://github.com/KC-2001MS/OnboardingUI/blob/main/LICENSE)

## Author (作者)

[Keisuke Chinone 茅根 啓介 (Iroiro いろいろ)](https://github.com/KC-2001MS)
