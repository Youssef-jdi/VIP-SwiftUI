//
//  ProcessInfo.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import Foundation

extension ProcessInfo {
    var isRunningTests: Bool {
        environment["APP_IS_RUNNING_TEST"] == "YES"
    }
}
