//
//  GroupServersView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/4/24.
//

import SwiftUI

struct GroupServersView: View {
    var country1: String
    var country2: String
    var country3: String
    @Binding var server: String
    let back: () -> Void
    var body: some View {
        RoundedRectangle(cornerRadius: 12 * sizeScreen())
            .frame(width: 343 * sizeScreen(), height: 156 * sizeScreen())
            .foregroundColor(.white)
            .overlay(
                VStack(spacing: 0) {
                    HStack {
                        Image(country1)
                        Text(country1)
                            .foregroundColor(.black)
                            .font(.system(size: 16 * sizeScreen(), weight: .medium))
                        Spacer()
                        Image(country1 == server ? "dottPng" : "arrowPng")
                            .frame(width: 20 * sizeScreen(), height: 20 * sizeScreen())
                    }
                    .onTapGesture {
                        server = country1
                        back()
                    }
                    .padding()
                    Divider()
                    HStack {
                        Image(country2)
                        Text(country2)
                            .foregroundColor(.black)
                            .font(.system(size: 16 * sizeScreen(), weight: .medium))
                        Spacer()
                        Image(country2 == server ? "dottPng" : "arrowPng")
                            .frame(width: 20 * sizeScreen(), height: 20 * sizeScreen())
                    }
                    .onTapGesture {
                        server = country2
                        back()
                    }
                    .padding()
                    Divider()
                    HStack {
                        Image(country3)
                        Text(country3)
                            .foregroundColor(.black)
                            .font(.system(size: 16 * sizeScreen(), weight: .medium))
                        Spacer()
                        Image(country3 == server ? "dottPng" : "arrowPng")
                            .frame(width: 20 * sizeScreen(), height: 20 * sizeScreen())
                    }
                    .onTapGesture {
                        server = country3
                        back()
                    }
                    .padding()
                }
            )
    }
}

#Preview {
    GroupServersView(country1: "Japan", country2: "China", country3: "Thailand", server: .constant(""), back: {})
}
