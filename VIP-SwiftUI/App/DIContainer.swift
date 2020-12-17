//
//  DIContainer.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import SwiftUI
import Combine

struct DIContainer: EnvironmentKey {

    let appState: Store<AppState>

    init(appState: Store<AppState>) {
        self.appState = appState
    }

    init(appState: AppState) {
        self.init(appState: Store<AppState>(appState))
    }

    static var defaultValue: Self { Self.default }

    private static let `default` = Self(appState: AppState())
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}
