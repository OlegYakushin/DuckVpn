//
//  StrokeView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/11/24.
//

import SwiftUI

struct StrokeView: View {
    var text = "Connect"
     var body: some View {
         RoundedRectangle(cornerRadius: 12 * sizeScreen())
             .stroke(Color.blue, lineWidth: 2) 
             .background(Color.white.cornerRadius(12 * sizeScreen()))
             .frame(width: 343 * sizeScreen(), height: 50 * sizeScreen())
             .overlay(
                 Text(text)
                     .font(.system(size: 16 * sizeScreen(), weight: .semibold))
                     .foregroundColor(.blue)
                   
             )
     }
 }
#Preview {
    StrokeView()
}
