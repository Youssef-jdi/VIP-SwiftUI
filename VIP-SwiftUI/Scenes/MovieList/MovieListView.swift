//
//  MovieListView.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 12/16/20.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var stateModel: MovieListState
    private var interactor: MovieListInteractorProtcol

    var body: some View {
        Button("\(stateModel.a)") {
            interactor.buttonClicked()
        }.onReceive(stateModel.$a, perform: { value in
            print("changed \(value)")
        })
//        .onAppear {
//            print("\(ProcessInfo.processInfo.environment["hello"])")
//        }
    }
}

extension MovieListView {
    public static func build() -> some View {
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        let state = MovieListState()

        presenter.stateModel = state
        interactor.presenter = presenter

        return MovieListView(stateModel: state, interactor: interactor)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView.build()
    }
}
