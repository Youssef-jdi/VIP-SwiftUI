//
//  AppState.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 16/12/2020.
//

import Combine
import SwiftUI

typealias Store<State> = CurrentValueSubject<State, Never>


struct AppState: Equatable {
    var system = System()
}

func == (lhs: AppState, rhs: AppState) -> Bool {
    return lhs.system == rhs.system
}

extension AppState {
    struct System: Equatable {
        var isActive: Bool = false
        var keyboardHeight: CGFloat = 0
    }
}
