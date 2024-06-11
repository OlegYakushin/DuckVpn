//
//  ConnectButton.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/4/24.
//

import SwiftUI

struct ConnectButton: View {
    var text = "Connect"
    var body: some View {
        RoundedRectangle(cornerRadius: 12 * sizeScreen())
            .frame(width: 343 * sizeScreen(), height: 50 * sizeScreen())
            .foregroundColor(.blue)
            .overlay(
            Text(text)
                .font(.system(size: 16 * sizeScreen(), weight: .semibold))
                .foregroundColor(.white)
            )
    }
}

#Preview {
    ConnectButton()
}
