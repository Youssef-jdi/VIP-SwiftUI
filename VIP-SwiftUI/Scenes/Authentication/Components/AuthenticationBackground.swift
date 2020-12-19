//
//  AuthenticationBackground.swift
//  VIP-SwiftUI
//
//  Created by Youssef Jdidi on 19/12/2020.
//

import SwiftUI

struct AuthenticationBackground: View {
    var body: some View {
        LinearGradient(
            gradient: .init(
                colors:
                    [
                        Color(R.color.first()!),
                        Color(R.color.second()!),
                        Color(R.color.third()!)
                    ]),
            startPoint: .top,
            endPoint: .bottom)
    }
}

struct AuthenticationBackground_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationBackground().previewLayout(.device).ignoresSafeArea(.all)
    }
}
