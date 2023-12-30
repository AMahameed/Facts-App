//
//  Logger.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import OSLog

struct Log {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let viewCycle = Logger(subsystem: subsystem, category: "info")
    static let data = Logger(subsystem: subsystem, category: "data")
    static let error = Logger(subsystem: subsystem, category: "error")
}
