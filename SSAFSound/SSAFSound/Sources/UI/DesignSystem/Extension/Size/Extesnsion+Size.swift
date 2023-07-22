//
//  Extesnsion+Size.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/16.
//

import SwiftUI

public extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
    static let qrcodeButtonWidth = screenWidth - (screenWidth * 0.1)
    
}
