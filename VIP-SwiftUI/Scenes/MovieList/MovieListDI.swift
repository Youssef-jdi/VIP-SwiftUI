//
//  MovieListDI.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 18/12/2020.
//

import Foundation

extension DIContainer {
    struct MovieListDI {
        let movieListInteractor: MovieListInteractorProtcol
        let movieListPresenter: MovieListPresenterProtocol
        let movieListService: MovieServiceProtocol
        let movieListViewModel: MovieListViewModel

        init(
            movieListInteractor: MovieListInteractorProtcol,
            movieListPresenter: MovieListPresenterProtocol,
            movieListService: MovieServiceProtocol,
            movieListViewModel: MovieListViewModel
        ) {
            self.movieListInteractor = movieListInteractor
            self.movieListPresenter = movieListPresenter
            self.movieListService = movieListService
            self.movieListViewModel = movieListViewModel
        }

        static var stub: Self {
            let movieListViewModel = MovieListViewModel()
            let movieListPresenter = MovieListPresenter(viewModel: movieListViewModel)
            let movieListService = MovieService(session: AppEnvironment.configuredURLSession())
            let movieListInteractor = MovieListInteractor(presenter: movieListPresenter, service: movieListService)
            return .init(movieListInteractor: movieListInteractor, movieListPresenter: movieListPresenter, movieListService: movieListService, movieListViewModel: movieListViewModel)
        }
    }
}
