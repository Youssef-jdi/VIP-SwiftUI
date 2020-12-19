//
//  AuthenticationInteractor.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import Foundation

protocol AuthenticationInteractorProtocol {}

class AuthenticationInteractor: AuthenticationInteractorProtocol {
    private let presenter: AuthenticationPreseneterProtocol

    init(presenter: AuthenticationPreseneterProtocol) {
        self.presenter = presenter
    }
}
