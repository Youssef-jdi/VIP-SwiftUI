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

    var presenter: MovieListPresenterProtocol?

    func buttonClicked() {
        presenter?.presentButtonClicked()
    }
}
