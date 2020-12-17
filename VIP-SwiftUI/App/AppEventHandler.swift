//
//  AppEventHandler.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import Combine

protocol AppEventHandlerProtocol {
    func sceneDidBecomeActive()
    func sceneWillResignActive()
}

class AppEventHandler: AppEventHandlerProtocol {

    let container: DIContainer

    init(
        container: DIContainer
    ) {
        self.container = container
    }
    
    func sceneDidBecomeActive() {
        //from subscript<T> in store
        container.appState[\.system.isActive] = true
    }

    func sceneWillResignActive() {
        container.appState[\.system.isActive] = false
    }
}
