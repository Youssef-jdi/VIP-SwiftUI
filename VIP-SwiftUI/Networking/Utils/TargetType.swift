//
//  TargetType.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import Foundation

typealias HTTPCode = Int
typealias HTTPCodes = Range<HTTPCode>

protocol TargetType {
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    
    func body() throws -> Data?
}

enum APIError: Swift.Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case imageProcessing([URLRequest])
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case let .httpCode(code): return "Unexpected HTTP code: \(code)"
        case .unexpectedResponse: return "Unexpected response from the server"
        case .imageProcessing: return "Unable to load image"
        }
    }
}

extension TargetType {
    func urlRequest() throws -> URLRequest {
        guard let url = URL(string: BaseURL.apiURL + path) else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        return request
    }
}

extension HTTPCodes {
    static let success = 200 ..< 300
}
