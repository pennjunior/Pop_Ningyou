//
//  debugger.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/28.
//
import Foundation


func installCrashHandler() {
    NSSetUncaughtExceptionHandler { exception in
        print("💥 Uncaught Exception: \(exception.name.rawValue)")
        print("Reason: \(exception.reason ?? "Unknown")")
        print("Stack Trace:\n\(exception.callStackSymbols.joined(separator: "\n"))")
    }
}
