//
//  MovieListView.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 12/16/20.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel: MovieListViewModel
    private let interactor: MovieListInteractorProtcol
    //@Environment(\.injected) private var container: DIContainer

    var body: some View {
        Button("\(viewModel.a)") {
            interactor.buttonClicked()
        }.onReceive(viewModel.$a, perform: { value in
            print("changed \(value)")
        })
    }
}

extension MovieListView {
    public static func build(_ container: DIContainer) -> some View {
        let interactor = container.movieListDI.movieListInteractor
        let viewModel = container.movieListDI.movieListViewModel

        return MovieListView(viewModel: viewModel, interactor: interactor)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView.build(.preview)
    }
}
