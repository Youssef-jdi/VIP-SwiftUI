//
//  MovieListPresenter.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 12/16/20.
//

import Foundation

protocol MovieListPresenterProtocol {
    func presentButtonClicked()
}

class MovieListPresenter: MovieListPresenterProtocol {
    var stateModel: MovieListState?

    func presentButtonClicked() {
        stateModel?.a += 1
    }
}
