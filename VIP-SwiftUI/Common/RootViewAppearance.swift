//
//  RootViewAppearance.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 17/12/2020.
//

import SwiftUI
import Combine

struct RootViewAppearance: ViewModifier {

    @Environment(\.injected) private var injected: DIContainer
    @State private var isActive: Bool = false
    private let inspection = PassthroughSubject<((AnyView) -> Void), Never>()
    private var isActiveUpdate: AnyPublisher<Bool, Never> {
        injected.appState.updates(for: \.system.isActive)
    }

    func body(content: Content) -> some View {
        content
            .blur(radius: isActive ? 0 : 10)
            .onReceive(isActiveUpdate) { self.isActive = $0 }
            .onReceive(inspection) { callback in
                callback(AnyView(self.body(content: content)))
            }
    }
}
