//
//  LottieView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/5/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var filename: String

    func makeUIView(context: Context) -> some UIView {
        let view = AnimationView()
        let animation = Animation.named(filename)
        view.animation = animation
        view.contentMode = .scaleAspectFit
        view.play()
        view.loopMode = .loop
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
