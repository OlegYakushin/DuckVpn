//
//  HomeView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/3/24.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @AppStorage("server") private var server: String = "Ukraine"
    @State private var showBuyNFTView = false
    @State private var showDisconnectView = false
    @State private var isConnected = false
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(spacing: 30 * sizeScreen()) {
                ProfileRectangle(name: "Arina", wallet: "0QB8-Bq-9cFs", settings: {showDisconnectView.toggle()})
                Spacer()
                if isConnected {
                    LottieView(animation: .named("connectAnimation"))
                        .playing(loopMode: .loop)
                        .frame(width: 200 * sizeScreen(), height: 200 * sizeScreen())
                } else {
                    LottieView(animation: .named("disconnect"))
                        .playing(loopMode: .loop)
                        .frame(width: 200 * sizeScreen(), height: 200 * sizeScreen())
                }
                Spacer()
                VStack(spacing: 20 * sizeScreen())  {
                    NavigationLink(destination: ServersView().navigationBarBackButtonHidden()) {
                        EachServerView(country: server)
                    }
                    
                    if isConnected {
                        DisconnectButton()
                            .onTapGesture {
                                withAnimation {
                                    isConnected.toggle()
                                }
                            }
                    } else {
                        ConnectButton(text: "Connect")
                            .onTapGesture {
                                withAnimation {
                                    isConnected.toggle()
                                }
                            }
                    }
                }
                .offset(x:0, y: 50 * sizeScreen())
                Spacer()
                VStack(spacing: 20 * sizeScreen()) {
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
            .padding(.vertical, 30)
            
        }
        .sheet(isPresented: $showBuyNFTView) {
            BuyNFTView(showBuyNFTView: $showBuyNFTView)
                .presentationDetents([.fraction(3 / 4)])
               
                }
        .sheet(isPresented: $showDisconnectView) {
            DisconnectOverlay(showDisconnectView: $showDisconnectView)
                .presentationDetents([.fraction(1 / 5)])
               
                }
      
        

    }
}

#Preview {
    HomeView()
}
