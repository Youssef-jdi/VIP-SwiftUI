//
//  ContentView.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import SwiftUI

struct ContentView: View {
    private let container: DIContainer
    private let isRunningTests: Bool

    init(container: DIContainer, isRunningTests: Bool = ProcessInfo.processInfo.isRunningTests) {
        self.container = container
        self.isRunningTests = isRunningTests
    }

    var body: some View {
        Group {
            if isRunningTests {
                Text("Running Tests")
            } else {
                MovieListView
                    .build()
                    .inject(container)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: .preview)
    }
}
