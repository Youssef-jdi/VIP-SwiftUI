//
//  AuthenticationViewModel.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import Combine

class AuthenticationViewModel: ObservableObject {
    @Published var value: Int = 0
    @Published var openedTab: OpenedTab = .existing

    enum OpenedTab {
        case new
        case existing

        mutating func toggle() {
            switch self {
            case .existing: self = .new
            case .new: self = .existing
            }
        }
    }
}
