//
//  AuthenticationForm.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 19/12/2020.
//

import SwiftUI

struct AuthenticationForm: View {

    @ObservedObject var viewModel: AuthenticationViewModel

    let submitAction: () -> Void

    var body: some View {
        VStack {

            VStack {
                CustomTextField(
                    field: viewModel.openedTab == .existing ?
                        $viewModel.loginModel.email : $viewModel.registerModel.email,
                    textfieldType: .email,
                    error: $viewModel.error)
                if viewModel.openedTab == .new {
                    Divider()
                    CustomTextField(
                        field: $viewModel.registerModel.name,
                        textfieldType: .name,
                        error: $viewModel.error)
                }
                Divider()
                CustomTextField(
                    field: viewModel.openedTab == .existing ?
                        $viewModel.loginModel.pass : $viewModel.registerModel.pass,
                    textfieldType: .password,
                    error: $viewModel.error)
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
            Button(action:
                submitAction
            ) {

                Text(viewModel.openedTab == .existing ? "LOGIN" : "REGISTER")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
            }.disabled(isEmpty)
            .background(
                isEmpty ? AnyView(disabledView) : AnyView(AuthenticationBackground(backgroundFor: .button))
            )
            .cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
        }
    }

    private var disabledView: some View {
        return Color.gray
    }

    private var isEmpty: Bool {
        switch viewModel.openedTab {
        case .existing: return viewModel.loginModel.email.isEmpty || viewModel.loginModel.pass.isEmpty
        case .new: return viewModel.registerModel.email.isEmpty || viewModel.registerModel.pass.isEmpty || viewModel.registerModel.name.isEmpty
        }
    }
}

struct AuthenticationForm_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationForm(viewModel: .stub, submitAction: {})
        AuthenticationForm(viewModel: .stub, submitAction: {}).environment(\.colorScheme, .dark)
    }
}
