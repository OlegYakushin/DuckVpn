//
//  DisconnectButton.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/12/24.
//

import SwiftUI

struct DisconnectButton: View {
    var text = "Disconnect"
     var body: some View {
         RoundedRectangle(cornerRadius: 12 * sizeScreen())
             .stroke(Color.red, lineWidth: 2)
             .background(Color.clear)
             .frame(width: 343 * sizeScreen(), height: 50 * sizeScreen())
             .overlay(
                 Text(text)
                     .font(.system(size: 16 * sizeScreen(), weight: .semibold))
                     .foregroundColor(.red) // текст синего цвета
             )
     }
 }
#Preview {
    DisconnectButton()
}
