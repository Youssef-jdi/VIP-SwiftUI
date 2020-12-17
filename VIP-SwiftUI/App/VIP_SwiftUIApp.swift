//
//  VIP_SwiftUIApp.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 12/16/20.
//

import SwiftUI

//swiftlint:disable weak_delegate
@main
struct VIPSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appdelegate
    var body: some Scene {
        WindowGroup {}
    }
}
