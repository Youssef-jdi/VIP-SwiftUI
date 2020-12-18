//
//  MovieListInteractor.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 12/16/20.
//

import Foundation

protocol MovieListInteractorProtcol {
    func buttonClicked()
}

class MovieListInteractor: MovieListInteractorProtcol {

    private let presenter: MovieListPresenterProtocol
    private let service: MovieServiceProtocol

    init(
        presenter: MovieListPresenterProtocol,
        service: MovieServiceProtocol
    ) {
        self.presenter = presenter
        self.service = service
    }

    func buttonClicked() {
        presenter.presentButtonClicked()
    }
}
