//
//  Publisher + Utils.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import Combine
import Foundation


// MARK: Extract error
extension Publisher {
    func extractUnderlyingError() -> Publishers.MapError<Self, Failure> {
        mapError {
            ($0.underlyingError as? Failure) ?? $0
        }
    }
}

// MARK: Return Error when connection appears to be offline
extension Error {
   var underlyingError: Error? {
       let nsError = self as NSError
       if nsError.domain == NSURLErrorDomain && nsError.code == -1009 {
           // "The Internet connection appears to be offline."
           return self
       }
       return nsError.userInfo[NSUnderlyingErrorKey] as? Error
   }
}
