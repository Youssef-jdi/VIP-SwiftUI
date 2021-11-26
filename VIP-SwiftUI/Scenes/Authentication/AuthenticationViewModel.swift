//
//  AuthenticationViewModel.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import Combine

class AuthenticationViewModel: ObservableObject {
    @Published var value: Int = 0
    @Published var openedTab: OpenedTab = .existing
    @Published var loginModel = LoginModel()
    @Published var registerModel = RegisterModel()
    @Published var error: String = ""

    enum OpenedTab {
        case new
        case existing

        mutating func toggle() {
            switch self {
            case .existing: self = .new
            case .new: self = .existing
            }
        }
    }

    static var stub: AuthenticationViewModel {
        return AuthenticationViewModel()
    }
}

extension AuthenticationViewModel {
    class LoginModel: ObservableObject {
        @Published var email: String = ""
        @Published var pass: String = ""

        static var stub: LoginModel {
            return LoginModel()
        }
    }

    class RegisterModel: ObservableObject {
        @Published var email: String = ""
        @Published var pass: String = ""
        @Published var name: String = ""

        static var stub: RegisterModel {
            return RegisterModel()
        }
    }
}
