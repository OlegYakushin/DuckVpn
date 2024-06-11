//
//  ConnectView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/3/24.
//

import SwiftUI
import Lottie

struct ConnectView: View {
    var body: some View {
        NavigationView {
            let scale = sizeScreen()
            ZStack{
                BackgroundView()
                VStack(spacing: 20 * sizeScreen()) {
                    Spacer()
                    LottieView(animation: .named("startAnimation"))
                        .playing(loopMode: .loop)
                        .frame(width: 200 * scale, height: 200 * scale)
                    Text("Connect your TON\nwallet")
                        .font(.system(size: 30 * scale, weight: .heavy))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        Spacer()
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden()) {
                        ConnectButton()
                    }
                    
                    Text("I don’t have a ")
                        .font(.system(size: 16 * scale, weight: .medium))
                        .foregroundColor(.black)

                    +
                    Text("TON wallet")
                        .font(.system(size: 16 * scale, weight: .medium))
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 50 * scale)
            }
        }
    }
}

#Preview {
    ConnectView()
}
