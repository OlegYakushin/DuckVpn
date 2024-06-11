//
//  BuyNFTView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/3/24.
//

import SwiftUI
import Lottie

struct BuyNFTView: View {
    @Binding var showBuyNFTView: Bool
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
                            showBuyNFTView.toggle()
                        }
                }
            }
            .padding()
            HStack {
                VStack(alignment: .leading, spacing: 10 * sizeScreen()) {
                    Text("Get all fuatures of DUCK vpn")
                        .foregroundColor(.black)
                        .font(.system(size: 20 * sizeScreen(), weight: .bold))
                    Text("Exchange NFT for a VPN subscription")
                        .foregroundColor(Color("grayTwo"))
                        .font(.system(size: 14 * sizeScreen(), weight: .medium))
                }
                Spacer()
            }
            .padding(.horizontal, 20 * sizeScreen())
            VStack(spacing: 15 * sizeScreen()) {
                RoundedRectangle(cornerRadius: 12 * sizeScreen())
                    .frame(width: 230 * sizeScreen(), height: 230 * sizeScreen())
                    .foregroundColor(Color("blueOne"))
                    .overlay(
                        LottieView(animation: .named("nft"))
                            .playing(loopMode: .loop)
                            .frame(width: 150 * sizeScreen(), height: 150 * sizeScreen())
                    )
                    .padding(.vertical, 30 * sizeScreen())
                ConnectButton(text: "Buy NFT")
                StrokeView(text: "Use NFT")
            }
           
        }
        
    }
}

#Preview {
    BuyNFTView(showBuyNFTView: .constant(false))
}
