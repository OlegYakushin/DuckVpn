//
//  HomeView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/3/24.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @State private var showBuyNFTView = false
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(spacing: 30 * sizeScreen()) {
                ProfileRectangle(name: "Arina", wallet: "0QB8-Bq-9cFs")
                Spacer()
                LottieView(animation: .named("disconnect"))
                    .playing(loopMode: .loop)
                    .frame(width: 200 * sizeScreen(), height: 200 * sizeScreen())
                Spacer()
                
                NavigationLink(destination: ServersView().navigationBarBackButtonHidden()) {
                    EachServerView(country: "Ukraine")
                }
                
                ConnectButton()
                Spacer()
                VStack(spacing: 10 * sizeScreen()) {
                    Text("Subscription ends on May 30th.")
                        .font(.system(size: 16 * sizeScreen(), weight: .medium))
                        .padding(.bottom, -10)
                        .foregroundColor(.black)
                    Text("Extend")
                        .font(.system(size: 16 * sizeScreen(), weight: .medium))
                        .underline()
                        .foregroundColor(.blue)
                        .onTapGesture {
                                                  showBuyNFTView.toggle()
                                              }
                }
            }
            
        }
        .sheet(isPresented: $showBuyNFTView) {
            BuyNFTView(showBuyNFTView: $showBuyNFTView)
                .presentationDetents([.fraction(3 / 4)])
               
                }
      
        

    }
}

#Preview {
    HomeView()
}
