//
//  ColorExtension.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import SwiftUI

extension Color {
    
    static let label = Color(UIColor.label)
    static let secondaryLabel = Color(UIColor.secondaryLabel)
    static let link = Color(UIColor.link)
    
}

struct PadCheck {
    func isPad() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return true
        } else {
            return false
        }
    }
}

var appVersion: String {
    if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
        return version
    } else {
        return "N/A"
    }
}
