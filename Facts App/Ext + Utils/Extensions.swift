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
    var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad ? true : false
    }
}
