//
//  AuthenticationInteractor.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import Foundation

protocol AuthenticationInteractorProtocol {
    func handleLogin(_ request: AuthenticationViewModel.LoginModel)
    func handleRegister(_ request: AuthenticationViewModel.RegisterModel)
}

class AuthenticationInteractor: AuthenticationInteractorProtocol {
    private let presenter: AuthenticationPreseneterProtocol
    private let dataValidator: DataValidatorProtocol

    init(
        presenter: AuthenticationPreseneterProtocol,
        dataValidator: DataValidatorProtocol
    ) {
        self.presenter = presenter
        self.dataValidator = dataValidator
    }
}

// MARK: METHODS
extension AuthenticationInteractor {
    func handleLogin(_ request: AuthenticationViewModel.LoginModel) {}
    func handleRegister(_ request: AuthenticationViewModel.RegisterModel) {
        do {
            try validateDataRegisterRequest(request)
        } catch {
            guard let dataError = error as? DataError else { return }
            presenter.presentInvalidData(dataError)
        }
    }
}

// MARK: Private Functions
private extension AuthenticationInteractor {
    func validateDataRegisterRequest(_ request: AuthenticationViewModel.RegisterModel) throws {
        try dataValidator.validateEmail(request.email)
        try dataValidator.validatePassword(request.pass)
    }
}
