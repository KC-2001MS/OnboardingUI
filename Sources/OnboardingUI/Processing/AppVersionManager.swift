//
//  AppVersionManager.swift
//
//
//  Created by 茅根啓介 on 2023/03/09.
//

import Foundation
import Observation
import SwiftUI

/// A general-purpose operation recorder capable of determining the initial startup of an application or the startup of an application after an upgrade.
@available(iOS 17.0,macOS 14.0,watchOS 10.0,tvOS 17.0,visionOS 1.0,*)
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
    /// Whether or not this is the first activation.
    public var isTheFirstLaunch: Bool {
        get {
            return lastOpenedVersion == ""
        }
        
        set {
            lastOpenedVersion = version
        }
    }
    /// Variable to detect if the major version number has increased.
    public var isMajorVersionUpdated: Bool {
        get {
            let lastOpenedComponents = filled(splitByDot(lastOpenedVersion), count: 3)
            let currentComponents = filled(splitByDot(version), count: 3)
            return lastOpenedComponents[0] < currentComponents[0]
        }
        
        set {
            lastOpenedVersion = version
        }
    }
    /// Variable to detect if the minor version number or higher has increased.
    public var isMajorOrMinorVersionUpdated: Bool {
        get {
            let lastOpenedComponents = filled(splitByDot(lastOpenedVersion), count: 3)
            let currentComponents = filled(splitByDot(version), count: 3)
            return (lastOpenedComponents[0] < currentComponents[0] && lastOpenedComponents[1] <= currentComponents[1]) ||
            (lastOpenedComponents[0] <= currentComponents[0] && lastOpenedComponents[1] < currentComponents[1])
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
/// AppVersionManager environment key
@available(iOS 17.0,macOS 14.0,watchOS 10.0,tvOS 17.0,visionOS 1.0,*)
public struct AppVersionManagerKey: EnvironmentKey {
    public static var defaultValue = AppVersionManager()
}
/// AppVersionManager environment values
@available(iOS 17.0,macOS 14.0,watchOS 10.0,tvOS 17.0,visionOS 1.0,*)
public extension EnvironmentValues {
    var appVersionManager: AppVersionManager {
        get { self[AppVersionManagerKey.self] }
        set { self[AppVersionManagerKey.self] = newValue }
    }
}
