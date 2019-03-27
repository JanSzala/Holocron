//
//  Logger.swift
//  SWAPI_client
//
//  Created by JanSzala on 27/03/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

public class Logger {
    public enum Mode {
        case debug
        case warning
        case error
    }
    
    private let isProduction: Bool
    
    init(isProduction: Bool) {
        self.isProduction = isProduction
    }
    
    func log(_ message: String, mode: Mode, lineNumber: Int, functionName: String, fileName: String) {
        let logMessage = "[\((fileName as NSString).lastPathComponent): \(lineNumber) - \(functionName)] \(message)"
        
        switch (mode, isProduction) {
        case (.error, _):
            print("❌ \(logMessage)")
        case (_, true):
            break
        case (.warning, false):
            print("⚠️ \(logMessage)")
        case (.debug, false):
            print("📝 \(logMessage)")
        }
    }
}

private let logger = Logger(isProduction: false)

public func logMsg(_ message: String = "",
                   mode: Logger.Mode = .debug,
                   lineNumber: Int = #line,
                   functionName: String = #function,
                   fileName: String = #file) {
    logger.log(message, mode: mode, lineNumber: lineNumber, functionName: functionName, fileName: fileName)
}
