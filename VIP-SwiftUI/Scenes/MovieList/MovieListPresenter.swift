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
    private let viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    func presentButtonClicked() {
        viewModel.a += 1
    }
}
