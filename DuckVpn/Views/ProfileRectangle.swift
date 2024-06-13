//
//  ProfileRectangle.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/4/24.
//

import SwiftUI

struct ProfileRectangle: View {
    var name: String
    var wallet: String
    let settings: () -> Void
    var body: some View {
        RoundedRectangle(cornerRadius: 20 * sizeScreen())
            .frame(width: 343 * sizeScreen(), height: 71 * sizeScreen())
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image("profileImage")
                    VStack(alignment: .leading, spacing: 5 * sizeScreen()) {
                        Text(name)
                            .font(.system(size: 16 * sizeScreen(), weight: .medium))
                            .foregroundColor(.black)
                        HStack {
                            Text(wallet)
                                .font(.system(size: 14 * sizeScreen(), weight: .regular))
                                .foregroundColor(.gray)
                            Image("copyPng")
                                .frame(width: 15 * sizeScreen(), height: 15 * sizeScreen())
                                .onTapGesture {
                                                UIPasteboard.general.string = wallet
                                                               }
                        }
                    }
                    Spacer()
                    Image("settingsPng")
                        .frame(width: 24 * sizeScreen(), height: 24 * sizeScreen())
                        .onTapGesture {
                            settings()
                        }
                }
                    .padding()
            )
    }
}

#Preview {
    ProfileRectangle(name: "Arina", wallet: "0QB8-Bq-9cFs", settings: {})
}
