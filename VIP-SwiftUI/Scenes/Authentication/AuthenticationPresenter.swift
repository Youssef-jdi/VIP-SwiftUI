//
//  AuthenticationPresenter.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import Foundation

protocol AuthenticationPreseneterProtocol {}

class AuthenticationPresenter: AuthenticationPreseneterProtocol {
    private let viewModel: AuthenticationViewModel

    init(viewModel: AuthenticationViewModel) {
        self.viewModel = viewModel
    }
}
