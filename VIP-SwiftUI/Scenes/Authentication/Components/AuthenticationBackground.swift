//
//  AuthenticationBackground.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 19/12/2020.
//

import SwiftUI

struct AuthenticationBackground: View {

    let backgroundFor: BackgroundFor

    var body: some View {
        LinearGradient(
            gradient: .init(
                colors:
                    [
                        Color(R.color.first()!),
                        Color(R.color.second()!),
                        Color(R.color.third()!)
                    ]),
            startPoint: backgroundFor == .view ? .top : .leading,
            endPoint: backgroundFor == .view ? .bottom : .trailing)
    }

    enum BackgroundFor {
        case view
        case button
    }
}

struct AuthenticationBackground_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationBackground(backgroundFor: .view).previewLayout(.device).ignoresSafeArea(.all)
    }
}
