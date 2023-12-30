//
//  Functions.swift
//  
//  
//  Created by Keisuke Chinone on 2023/12/30.
//


import Foundation

/// Function to split the version number dot by dot
@available(iOS 17.0,macOS 14.0,watchOS 10.0,tvOS 17.0,visionOS 1.0,*)
func splitByDot(_ versionNumber: String) -> [Int] {
    return versionNumber.split(separator: ".").map { string -> Int in
        return Int(string) ?? 0
    }
}
/// Function to unify the number of elements in an array
@available(iOS 17.0,macOS 14.0,watchOS 10.0,tvOS 17.0,visionOS 1.0,*)
func filled(_ target: [Int], count: Int) -> [Int] {
    return (0..<count).map { i -> Int in
        (i < target.count) ? target[i] : 0
    }
}
