//
//  DIContainer.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import SwiftUI
import Combine

struct DIContainer: EnvironmentKey {

    let appState: Store<AppState>
    let movieListDI: MovieListDI
    let authenticationDI: AuthenticationDI

    init(
        appState: Store<AppState>,
        movieListDI: MovieListDI,
        authenticationDI: AuthenticationDI
    ) {
        self.appState = appState
        self.movieListDI = movieListDI
        self.authenticationDI = authenticationDI
    }

    init(
        appState: AppState,
        movieListDI: MovieListDI,
        authenticationDI: AuthenticationDI
    ) {
        self.init(
            appState: Store<AppState>(appState),
            movieListDI: movieListDI,
            authenticationDI: authenticationDI
            )
    }

    // MARK: Playground
    struct Teapot {
        var canTalk: Bool

        static func createTeapots(count: Int, canTalk: Bool) -> [Self] {
            return (0..<count).map { _ in Teapot(canTalk: canTalk) }
        }
    }

    static var defaultValue: Self { Self.default }

    private static let `default` = Self(appState: AppState(), movieListDI: .stub, authenticationDI: .stub)
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

#if DEBUG
extension DIContainer {
    static var preview: Self {
        .init(appState: .init(AppState.preview), movieListDI: .stub, authenticationDI: .stub)
    }
}
#endif
