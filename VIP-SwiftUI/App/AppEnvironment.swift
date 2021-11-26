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
        let dataValidator = setupDataValidator()
        let movieListViewDI = setupMovieListView(session: session)
        let authenticationViewDI = setupAuthenticationView(session: session, dataValidator: dataValidator)
        let diContainer = DIContainer(appState: appState, movieListDI: movieListViewDI, authenticationDI: authenticationViewDI)
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

    private static func setupAuthenticationView(session: URLSession, dataValidator: DataValidatorProtocol) -> DIContainer.AuthenticationDI {
        let viewModel = AuthenticationViewModel()
        let presenter = AuthenticationPresenter(viewModel: viewModel)
        let interactor = AuthenticationInteractor(presenter: presenter, dataValidator: dataValidator)

        return .init(authenticationInteractor: interactor, authenticationPresenter: presenter, authenticationViewModel: viewModel)
    }

    private static func setupDataValidator() -> DataValidator {
        return .init()
    }
}
