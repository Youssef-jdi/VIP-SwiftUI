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
            AuthenticationBackground()
                .edgesIgnoringSafeArea(.all)
            VStack {
                AuthenticationTab(viewModel: viewModel)
                    .background(Color.black.opacity(0.1))
                    .clipShape(Capsule())
                    .padding(.top, 25)
                Spacer()
            }
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
