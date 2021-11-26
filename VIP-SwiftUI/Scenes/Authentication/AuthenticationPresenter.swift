//
//  AuthenticationPresenter.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import Foundation

protocol AuthenticationPreseneterProtocol {
    func presentInvalidData(_ error: DataError)
}

class AuthenticationPresenter: AuthenticationPreseneterProtocol {
    private let viewModel: AuthenticationViewModel

    init(viewModel: AuthenticationViewModel) {
        self.viewModel = viewModel
    }
}

extension AuthenticationPresenter {
    func presentInvalidData(_ error: DataError) {
        switch error {
        case .invalidEmail: viewModel.error = error.description
        case .invalidPassword: break
        }
    }
}
