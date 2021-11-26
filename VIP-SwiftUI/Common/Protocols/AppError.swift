//
//  AppError.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 21/12/2020.
//

import Foundation

protocol AppError: Error {
    var title: String { get }
    var description: String { get }
}
