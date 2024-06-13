//
//  DisconnectOverlay.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/12/24.
//

import SwiftUI

struct DisconnectOverlay: View {
    @Binding var showDisconnectView: Bool
    let back: () -> Void
     var body: some View {
         VStack {
             ZStack {
                 Image("indicatePng")
                     .frame(width: 36 * sizeScreen(), height: 4 * sizeScreen())
                 HStack {
                     Spacer()
                     Image("closeButton")
                         .frame(width: 28 * sizeScreen(), height: 28 * sizeScreen())
                         .onTapGesture {
                             showDisconnectView.toggle()
                         }
                 }
             }
             .padding()
             DisconnectButton()
                 .onTapGesture {
                     showDisconnectView.toggle()
                     back()
                 }
             Spacer()
         }
     }
 }

#Preview {
    DisconnectOverlay(showDisconnectView: .constant(false), back: {})
}
