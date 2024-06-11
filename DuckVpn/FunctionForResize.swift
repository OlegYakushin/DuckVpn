//
//  FunctionForResize.swift
//  DuckVpn
//
//  Created by Oleg Yakushin on 6/4/24.
//

import Foundation
import SwiftUI

func sizeScreen(for designWidth: CGFloat = 375, designHeight: CGFloat = 856) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let widthScale = screenWidth / designWidth
    let heightScale = screenHeight / designHeight
    
    let scale = min(widthScale, heightScale)
    
    return scale

}
