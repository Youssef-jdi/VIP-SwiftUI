//
//  CustomTextfield.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 20/12/2020.
//

import SwiftUI

struct CustomTextField: View {

    @Binding var field: String
    @State var isSecured: Bool = true
    var textfieldType: TextFieldType
    @Binding var error: String

    var body: some View {
        HStack(spacing: 15) {

            Image(systemName: textfieldType.rawValue)
                .foregroundColor(.black)
            if textfieldType == .password {
                if isSecured {
                    SecureField("Password", text: self.$field)
                        .foregroundColor(.black)
                } else {
                    TextField("Password", text: self.$field)
                        .foregroundColor(.black)
                }

                Button(action: {
                    self.isSecured.toggle()
                }) {
                    Image(systemName: isSecured ? "eye" : "eye.slash")
                        .foregroundColor(.black)
                }
            } else {
                TextField(
                    textfieldType == .email ?
                        "Enter Email Address" : "Enter your name",
                    text: self.$field)
                    .foregroundColor(.black)
                if !error.isEmpty {
                    Text(error)
                }
            }
        }.padding(.vertical, 20)
    }

    enum TextFieldType: String {
        case email = "envelope"
        case password = "lock"
        case name = "person"
    }
}
