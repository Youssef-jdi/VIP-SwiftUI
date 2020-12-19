//
//  AuthenticationTab.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 19/12/2020.
//

import SwiftUI

struct AuthenticationTab: View {

    @ObservedObject var viewModel: AuthenticationViewModel

    var body: some View {
        HStack {
            TabButton(viewModel: viewModel, tabType: .existing, title: "Existing")
            TabButton(viewModel: viewModel, tabType: .new, title: "New")
        }
    }
}

struct TabButton: View {

    @ObservedObject var viewModel: AuthenticationViewModel
    let tabType: AuthenticationViewModel.OpenedTab
    let title: String

    var body: some View {
        Button(
            action: {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                self.viewModel.openedTab.toggle()
            }
        }, label: {
            Text(title)
                .foregroundColor(self.viewModel.openedTab == tabType ? .black : .white)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
        }).background(self.viewModel.openedTab == tabType ? Color.white : Color.clear)
            .clipShape(Capsule())
    }
}

//struct AuthenticationTab_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthenticationTab()
//            .previewLayout(.sizeThatFits)
//    }
//}
