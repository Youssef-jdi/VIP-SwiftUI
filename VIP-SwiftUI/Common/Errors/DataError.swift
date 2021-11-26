//
//  DataError.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 21/12/2020.
//

import Foundation

enum DataError: AppError, Equatable {

    case invalidEmail
    case invalidPassword
//    case passwordNotMatch
//    case emptyName
//    case unselectCheckBox
//    case missingInfo

    var title: String {
        return "oops"
    }

    var description: String {
        switch self {
        case .invalidEmail:
            return "email_invalid_error"
        case .invalidPassword:
            return "password_invalid_error"
//        case .passwordNotMatch:
//            return "password_not_match_error"
//        case .emptyName:
//            return "name_empty_error"
//        case .unselectCheckBox:
//            return "unselect_checkbox_error"
//        case .missingInfo:
//            return "missing_info_error"
        }
    }
}
