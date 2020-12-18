//
//  File.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import Foundation

protocol MovieServiceProtocol: Client {}

class MovieService: MovieServiceProtocol {
    let bgQueue = DispatchQueue(label: "bg_parse_queue")
    let session: URLSession

    init(session: URLSession) {
        self.session = session
    }
}
