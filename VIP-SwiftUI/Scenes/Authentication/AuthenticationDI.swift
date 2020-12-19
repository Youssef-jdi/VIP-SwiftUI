//
//  AuthenticationDI.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import Foundation

extension DIContainer {
    struct AuthenticationDI {
        let authenticationInteractor: AuthenticationInteractorProtocol
        let authenticationPresenter: AuthenticationPreseneterProtocol
        let authenticationViewModel: AuthenticationViewModel

        init(
            authenticationInteractor: AuthenticationInteractorProtocol,
            authenticationPresenter: AuthenticationPreseneterProtocol,
            authenticationViewModel: AuthenticationViewModel
        ) {
            self.authenticationInteractor = authenticationInteractor
            self.authenticationPresenter = authenticationPresenter
            self.authenticationViewModel = authenticationViewModel
        }

        static var stub: Self {
            let viewModel = AuthenticationViewModel()
            let presenter = AuthenticationPresenter(viewModel: viewModel)
            let interactor = AuthenticationInteractor(presenter: presenter)
            return .init(authenticationInteractor: interactor, authenticationPresenter: presenter, authenticationViewModel: viewModel)
        }
    }
}
