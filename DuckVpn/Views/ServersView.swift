//
//  ServersView.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/3/24.
//

import SwiftUI
import Combine

struct ServersView: View {
    @AppStorage("server") private var server: String = "Ukraine"
    @Environment(\.presentationMode) var presentationMode
    
    @State private var searchText: String = ""
    @State private var isSearchFieldFocused: Bool = false
    private let countries = ["Japan", "China", "Thailand", "Ukraine", "France", "Italy"]
    
    @State private var keyboardOffset: CGFloat = 0
    private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading, spacing: 30 * sizeScreen()) {
                VStack(alignment: .leading) {
                    Text("Servers")
                        .foregroundColor(.black)
                        .font(.system(size: 20 * sizeScreen(), weight: .bold))
                    
                    RoundedRectangle(cornerRadius: 12 * sizeScreen())
                        .frame(width: 343 * sizeScreen(), height: 52 * sizeScreen())
                        .foregroundColor(.white)
                        .overlay(
                            HStack {
                                Image("searchPng")
                                TextField("Search location", text: $searchText, onEditingChanged: { isEditing in
                                    withAnimation {
                                        isSearchFieldFocused = isEditing
                                    }
                                })
                                .foregroundColor(.gray)
                                .autocapitalization(.none)
                                Spacer()
                            }
                            .padding()
                        )
                }
                
                if searchText.isEmpty && !isSearchFieldFocused {
                    VStack(alignment: .leading) {
                        Text("Asia")
                            .font(.system(size: 20 * sizeScreen(), weight: .bold))
                            .foregroundColor(.black)
                        
                        GroupServersView(country1: "Japan", country2: "China", country3: "Thailand", server: $server, back: {presentationMode.wrappedValue.dismiss()})
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Europe")
                            .font(.system(size: 20 * sizeScreen(), weight: .bold))
                            .foregroundColor(.black)
                        
                        GroupServersView(country1: "Ukraine", country2: "France", country3: "Italy", server: $server, back: {presentationMode.wrappedValue.dismiss()})
                    }
                } else {
                    ScrollView {
                        ForEach(countries.filter { $0.lowercased().contains(searchText.lowercased()) }, id: \.self) { country in
                            EachServerView(country: country)
                                .onTapGesture {
                                    server = country
                                    presentationMode.wrappedValue.dismiss()
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .frame(maxHeight: 300 * sizeScreen())
                }
                
                Spacer()
            }
            .padding()
            .offset(y: -keyboardOffset)
            .animation(.easeOut(duration: 0.16), value: keyboardOffset)
        }
        .gesture(
                  DragGesture()
                      .onEnded { gesture in
                          if gesture.translation.width > 100 {
                              presentationMode.wrappedValue.dismiss()
                          }
                      }
              )
    }
    

    
}

#Preview {
    ServersView()
}
