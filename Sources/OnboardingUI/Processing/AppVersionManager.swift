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
    /// Whether or not this is the first activation
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
            if !lastOpenedVersion.isEmpty {
                let lastOpenedComponents = parseVersion(lastOpenedVersion)
                let currentComponents = parseVersion(version)
                return lastOpenedComponents.major < currentComponents.major
            } else {
                return false
            }
        }
        
        set {
            lastOpenedVersion = version
        }
    }
    /// Variable to detect if the minor version number or higher has increased.
    public var isMinorVersionUpdated: Bool {
        get {
            if !lastOpenedVersion.isEmpty {
                let lastOpenedComponents = parseVersion(lastOpenedVersion)
                let currentComponents = parseVersion(version)
                return lastOpenedComponents.major == currentComponents.major && lastOpenedComponents.minor < currentComponents.minor
            } else {
                return false
            }
        }
        
        set {
            lastOpenedVersion = version
        }
    }
    /// Default initializer
    public init() {
        self.version = Bundle.main
            .object(
                forInfoDictionaryKey: "CFBundleShortVersionString"
            ) as! String
        self.lastOpenedVersion = userDefaults
            .string(forKey: "LastOpenedVersion") ?? ""
    }

    func parseVersion(_ versionString: String) -> (major: Int, minor: Int, patch: Int) {
        var components = versionString.split(separator: ".").compactMap { Int($0) }
        components = (0..<3).map { $0 < components.count ? components[$0] : 0 }
        return (major: components[0], minor: components[1], patch: components[2])
    }
}
/// AppVersionManager environment values
@available(iOS 17.0,macOS 14.0,watchOS 10.0,tvOS 17.0,visionOS 1.0,*)
public extension EnvironmentValues {
    @Entry var appVersionManager: AppVersionManager = AppVersionManager()
}
