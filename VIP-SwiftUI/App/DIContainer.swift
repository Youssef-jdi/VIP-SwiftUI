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

    init(
        appState: Store<AppState>,
        movieListDI: MovieListDI
    ) {
        self.appState = appState
        self.movieListDI = movieListDI
    }

    init(appState: AppState, movieListDI: MovieListDI) {
        self.init(
            appState: Store<AppState>(appState),
            movieListDI: movieListDI
            )
    }

    static var defaultValue: Self { Self.default }

    private static let `default` = Self(appState: AppState(), movieListDI: .stub)
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
        .init(appState: .init(AppState.preview), movieListDI: .stub)
    }
}
#endif
