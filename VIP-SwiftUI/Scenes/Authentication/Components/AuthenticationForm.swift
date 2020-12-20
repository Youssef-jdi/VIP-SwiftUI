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
                    textfieldType: .email)
                if viewModel.openedTab == .new {
                    Divider()
                    CustomTextField(field: $viewModel.registerModel.name, textfieldType: .name)
                }
                Divider()
                CustomTextField(
                    field: viewModel.openedTab == .existing ?
                        $viewModel.loginModel.pass : $viewModel.registerModel.pass,
                    textfieldType: .password)
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
            }.background(
                AuthenticationBackground(backgroundFor: .button)
            )
            .cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
        }
    }
}

struct CustomTextField: View {

    @Binding var field: String
    var textfieldType: TextFieldType

    var body: some View {
        HStack(spacing: 15) {

            Image(systemName: textfieldType.rawValue)
                .foregroundColor(.black)
            if textfieldType == .password {
                SecureField("Password", text: self.$field)
                    .foregroundColor(.black)

                Button(action: {}) {
                    Image(systemName: "eye")
                        .foregroundColor(.black)
                }
            } else {
                TextField(
                    textfieldType == .email ?
                        "Enter Email Address" : "Enter your name",
                    text: self.$field)
                    .foregroundColor(.black)
            }
        }.padding(.vertical, 20)
    }

    enum TextFieldType: String {
        case email = "envelope"
        case password = "lock"
        case name = "person"
    }
}

struct AuthenticationForm_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationForm(viewModel: .stub, submitAction: {})
        AuthenticationForm(viewModel: .stub, submitAction: {}).environment(\.colorScheme, .dark)
    }
}
