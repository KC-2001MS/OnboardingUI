//
//  Onboarding.swift
//
//  
//  Created by Keisuke Chinone on 2023/12/10.
//


import Foundation

@available(iOS 17.0,macOS 14,visionOS 1,*)
protocol Onboarding: Identifiable, Sendable {
    var id: UUID { get }
    
    var title: String? { set get }
    
    var message: String? { set get }
}

@available(iOS 17.0,macOS 14,visionOS 1,*)
struct Feature: Identifiable, Sendable {
    var id: UUID = UUID()
    
    var title: String = ""
    
    var imageName: String = ""
    
    var message: String = ""
}
