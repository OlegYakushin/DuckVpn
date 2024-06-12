//
//  EachServerView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/4/24.
//

import SwiftUI

struct EachServerView: View {
    var country: String
    var body: some View {
        RoundedRectangle(cornerRadius: 12 * sizeScreen())
            .frame(width: 343 * sizeScreen(), height: 50 * sizeScreen())
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(country)
                    Text(country)
                        .font(.system(size: 16 * sizeScreen(), weight: .medium))
                        .foregroundColor(.black)
                        .bold()
                    Spacer()
                    Image("arrowPng")
                        .frame(width: 20 * sizeScreen(), height: 20 * sizeScreen())
                }
                    .padding()
            )
    }
}

#Preview {
    EachServerView(country: "Ukraine")
}
