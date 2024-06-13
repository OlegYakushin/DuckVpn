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
    @State private var showCopyMessage = false
    @Environment(\.presentationMode) var presentationMode
    private let stickers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"]
    @State private var selectedSticker: String?
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 30 * sizeScreen()) {
                ProfileRectangle(name: "Arina", wallet: "0QB8-Bq-9cFs", settings: { showDisconnectView.toggle() }, onCopy: {
                    withAnimation {
                        showCopyMessage = true
                    }
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            
                            showCopyMessage = false
                        }
                    }
                })
                Spacer()
                if isConnected {
                    LottieView(animation: .named(selectedSticker!))
                        .playing(loopMode: .loop)
                        .frame(width: 200 * sizeScreen(), height: 200 * sizeScreen())
                } else {
                    LottieView(animation: .named("disconnect"))
                        .playing(loopMode: .loop)
                        .frame(width: 200 * sizeScreen(), height: 200 * sizeScreen())
                }
                Spacer()
                VStack(spacing: 20 * sizeScreen()) {
                    NavigationLink(destination: ServersView().navigationBarBackButtonHidden()) {
                        EachServerView(country: server)
                    }
                    
                    if isConnected {
                        DisconnectButton()
                            .onTapGesture {
                                withAnimation {
                                    isConnected.toggle()
                                    selectedSticker = nil
                                }
                            }
                    } else {
                        ConnectButton(text: "Connect")
                            .onTapGesture {
                                withAnimation {
                                    isConnected.toggle()
                                    selectedSticker = stickers.randomElement()
                                }
                            }
                    }
                }
                .offset(x: 0, y: 50 * sizeScreen())
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
            
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .animation(.easeInOut(duration: 0.5), value: showCopyMessage)
                VStack {
                    Text("Copy")
                        .font(.system(size: 16 * sizeScreen(), weight: .medium))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                }
            }
            .opacity(showCopyMessage ? 1 : 0)
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.5), value: showCopyMessage)
            
              
        }
        
        .sheet(isPresented: $showBuyNFTView) {
            BuyNFTView(showBuyNFTView: $showBuyNFTView)
                .presentationDetents([.fraction(3 / 4)])
        }
        .sheet(isPresented: $showDisconnectView) {
            DisconnectOverlay(showDisconnectView: $showDisconnectView, back: { presentationMode.wrappedValue.dismiss() })
                .presentationDetents([.fraction(1 / 5)])
        }
    }
}

#Preview {
    HomeView()
}
