//
//  AuthenticationView.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import SwiftUI

struct AuthenticationView: View {

    @ObservedObject private var viewModel: AuthenticationViewModel
    private let interactor: AuthenticationInteractorProtocol

    var body: some View {
        ZStack {
            AuthenticationBackground(backgroundFor: .view)
                .edgesIgnoringSafeArea(.all)
            VStack {
                AuthenticationTab(viewModel: viewModel)
                    .background(Color.black.opacity(0.1))
                    .clipShape(Capsule())
                    .padding(.top, 25)
                AuthenticationForm(viewModel: viewModel, submitAction: {
                    handleSubmit()
                })
            }
        }
    }

    private func handleSubmit() {
        switch viewModel.openedTab {
        case .existing: interactor.handleLogin(viewModel.loginModel)
        case .new: interactor.handleRegister(viewModel.registerModel)
        }
    }
}

extension AuthenticationView {
    public static func build(_ container: DIContainer) -> some View {
        let interactor = container.authenticationDI.authenticationInteractor
        let viewModel = container.authenticationDI.authenticationViewModel

        return AuthenticationView(viewModel: viewModel, interactor: interactor)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView
            .build(.preview)
            .environment(\.colorScheme, .dark)
        AuthenticationView
            .build(.preview)
            .environment(\.colorScheme, .light)
    }
}
