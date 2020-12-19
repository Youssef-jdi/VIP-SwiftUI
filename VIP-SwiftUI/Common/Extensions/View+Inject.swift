//
//  View + Inject.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import SwiftUI

// MARK: - Injection in the view hierarchy

extension View {

    func inject
    (
        _ appState: AppState,
        _ movieListDi: DIContainer.MovieListDI,
        _ authenticationDI: DIContainer.AuthenticationDI
    ) -> some View {
        let container = DIContainer(
            appState: .init(appState),
            movieListDI: movieListDi,
            authenticationDI: authenticationDI
        )
        return inject(container)
    }

     func inject(_ container: DIContainer) -> some View {
        return self
            .modifier(RootViewAppearance())
            .environment(\.injected, container)
    }
}
