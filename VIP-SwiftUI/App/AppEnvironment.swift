//
//  AppEnvironment.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import SwiftUI
import Combine

struct AppEnvironment {
    let container: DIContainer
    let appEventHandler: AppEventHandlerProtocol
}

extension AppEnvironment {
    static func setup() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        let session = configuredURLSession()
        let movieListViewDI = setupMovieListView(session: session)
        let diContainer = DIContainer(appState: appState, movieListDI: movieListViewDI)
        let appEventHandler = AppEventHandler(container: diContainer)

        return AppEnvironment(container: diContainer, appEventHandler: appEventHandler)
    }

     static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }

    private static func setupMovieListView(session: URLSession) -> DIContainer.MovieListDI {
        let movieListService = MovieService(session: session)
        let movieListViewModel = MovieListViewModel()
        let movieListPresenter = MovieListPresenter(viewModel: movieListViewModel)
        let movieListInteractor = MovieListInteractor(presenter: movieListPresenter, service: movieListService)
        return .init(movieListInteractor: movieListInteractor, movieListPresenter: movieListPresenter, movieListService: movieListService, movieListViewModel: movieListViewModel)
    }
}
