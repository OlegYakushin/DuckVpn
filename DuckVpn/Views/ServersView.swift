//
//  ServersView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/3/24.
//

import SwiftUI

struct ServersView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading, spacing: 30 * sizeScreen()) {
                VStack(alignment: .leading) {
                    Text("Servers")
                        .foregroundColor(.black)
                        .font(.system(size: 20 * sizeScreen(), weight: .bold))
                    RoundedRectangle(cornerRadius: 12 * sizeScreen())
                        .frame(width: 343 * sizeScreen(), height: 52 * sizeScreen())
                        .foregroundColor(.white)
                        .overlay(
                            HStack {
                                Image("searchPng")
                                Text("Search location")
                            
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                                .padding()
                        )
                }
                VStack(alignment: .leading) {
                    Text("Asia")
                        .font(.system(size: 20 * sizeScreen(), weight: .bold))
                        .foregroundColor(.black)
                    
                    GroupServersView(country1: "Japan", country2: "China", country3: "Thailand")
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                VStack(alignment: .leading) {
                    Text("Europe")
                        .font(.system(size: 20 * sizeScreen(), weight: .bold))
                        .foregroundColor(.black)
                    GroupServersView(country1: "Ukraine", country2: "France", country3: "Italy")
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ServersView()
}
