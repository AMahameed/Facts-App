//
//  ColorExtension.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import SwiftUI

extension Color {
    
    // MARK: - Label Color
    static let label = Color(UIColor.label)
    static let secondaryLabel = Color(UIColor.secondaryLabel)
    
    // MARK: - Other Color
    static let link = Color(UIColor.link)
    
    // MARK: System Color
    static let systemBlue = Color(UIColor.systemBlue)
    
}

struct PadCheck {
    var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad ? true : false
    }
}
