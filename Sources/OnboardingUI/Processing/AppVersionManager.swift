//
//  AppVersionManager.swift
//  
//
//  Created by 茅根啓介 on 2023/03/09.
//

import Foundation
import Observation
import SwiftUI

@available(iOS 17.0,macOS 14,visionOS 1,*)
@Observable
public class AppVersionManager {
    private let userDefaults = UserDefaults.standard
    /// Current app version
    public let version: String
    /// App version when the user last opened yout app
    public var lastOpenedVersion: String {
        didSet {
            userDefaults.set(lastOpenedVersion, forKey: "LastOpenedVersion")
        }
    }
    /// Variable to detect if the major version number has increased.
    public var isMajorVersionUpdated: Bool {
        get {
            let lastOpenedComponents = filled(splitByDot(lastOpenedVersion), count: 3)
            let currentComponents = filled(splitByDot(version), count: 3)
            return lastOpenedComponents[0] < currentComponents[0] || lastOpenedVersion == ""
        }
        
        set {
            lastOpenedVersion = version
        }
    }
    /// Variable to detect if the minor version number or higher has increased.
    public var isMinorOrPatchVersionUpdated: Bool {
        get {
            let lastOpenedComponents = filled(splitByDot(lastOpenedVersion), count: 3)
            let currentComponents = filled(splitByDot(version), count: 3)
            return lastOpenedComponents[0] == currentComponents[0] &&
            (lastOpenedComponents[1] < currentComponents[1] ||
             (lastOpenedComponents[1] == currentComponents[1] && lastOpenedComponents[2] < currentComponents[2]))
        }
        
        set {
            lastOpenedVersion = version
        }
    }
    /// Default initializer
    public init() {
        self.version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        self.lastOpenedVersion = userDefaults.string(forKey: "LastOpenedVersion") ?? ""
    }
}

public struct AppVersionManagerKey: EnvironmentKey {
    public static var defaultValue = AppVersionManager()
}

public extension EnvironmentValues {
    var appVersionManager: AppVersionManager {
        get { self[AppVersionManagerKey.self] }
        set { self[AppVersionManagerKey.self] = newValue }
    }
}
//バージョン番号をドットで分けて配列化
@available(iOS 17.0,macOS 14,visionOS 1,*)
func splitByDot(_ versionNumber: String) -> [Int] {
    return versionNumber.split(separator: ".").map { string -> Int in
        return Int(string) ?? 0
    }
}
//配列の要素数を統一
@available(iOS 17.0,macOS 14,visionOS 1,*)
func filled(_ target: [Int], count: Int) -> [Int] {
    return (0..<count).map { i -> Int in
        (i < target.count) ? target[i] : 0
    }
}
