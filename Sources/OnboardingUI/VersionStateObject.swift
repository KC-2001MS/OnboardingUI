//
//  VersionStateObject.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import Foundation

let userDefaults = UserDefaults.standard
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
        let lhsComponents = filled(splitByDot(lastOpenedVersion), count: 3)
        let rhsComponents = filled(splitByDot(version), count: 3)
        isFirstLaunchAfterUpdate =
        (lhsComponents[0] != rhsComponents[0] || lhsComponents[1] != rhsComponents[1]) && lastOpenedVersion != ""
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
