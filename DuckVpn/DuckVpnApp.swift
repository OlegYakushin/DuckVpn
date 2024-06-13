//
//  DuckVpnApp.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/3/24.
//

import SwiftUI

@main
struct DuckVpnApp: App {
    init() {
            UITraitCollection.current = UITraitCollection(userInterfaceStyle: .light)
        }
    var body: some Scene {
        WindowGroup {
            ConnectView()
        }
    }
}
