//
//  AppEnvironment.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import SwiftUI
import Combine

struct AppEnvironment {
    let container: DIContainer
    let appEventHandler: AppEventHandlerProtocol
}

extension AppEnvironment {
    static func setup() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        let diContainer = DIContainer(appState: appState)
        let appEventHandler = AppEventHandler(container: diContainer)

        return AppEnvironment(container: diContainer, appEventHandler: appEventHandler)
    }
}
