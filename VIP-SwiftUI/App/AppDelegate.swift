//
//  AppDelegate.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 12/16/20.
//

import UIKit

class AppDelegate: NSObject ,UIApplicationDelegate {

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: "Scene Configuration", sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }
}


