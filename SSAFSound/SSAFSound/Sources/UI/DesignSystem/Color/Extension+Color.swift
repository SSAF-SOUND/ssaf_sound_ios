//
//  Extension+Color.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation
import SwiftUI


public extension Color {
    
    // MARK: - BASIC
    static let basicBlack = ssafSoundColor(.basicBlack)
    static let basicWhite = ssafSoundColor(.basicWhite)
    
    // MARK: - Background
    static let background = ssafSoundColor(.background)
    static let backgroundLight = ssafSoundColor(.backgroundLight)
    static let backgroundGray = ssafSoundColor(.backgroundGray)
    
    // MARK: - Font
    static let fontBlack = ssafSoundColor(.fontBlack)
    static let fontBlueBlack = ssafSoundColor(.fontBlueBlack)
    static let fontWhite = ssafSoundColor(.fontWhite)
    
    
    // MARK: - MAIN
    
    // MARK: - Primary
    static let primaryDark = ssafSoundColor(.primaryDark)
    static let primaryDefault = ssafSoundColor(.primaryDefault)
    static let primaryPoint = ssafSoundColor(.primaryPoint)
    static let primaryStrong = ssafSoundColor(.primaryStrong)
    static let primarySub = ssafSoundColor(.primarySub)
   
    
    // MARK: - Secondary
    static let secondaryDark = ssafSoundColor(.secondaryDark)
    static let secondaryDefault = ssafSoundColor(.secondaryDefault)
    static let secondaryPoint = ssafSoundColor(.secondaryPoint)
    static let secondaryStrong = ssafSoundColor(.secondaryStrong)
    static let secondarySub = ssafSoundColor(.secondarySub)
    
    // MARK: - MajorColor
    static let major = ssafSoundColor(.major)
    static let majorDark = ssafSoundColor(.majorDark)
    static let nonMajor = ssafSoundColor(.nonMajor)
    static let nonMajorDark = ssafSoundColor(.nonMajorDark)
    
    // MARK: - Point
    static let pointGreen = ssafSoundColor(.pointGreen)
    static let pointOrange = ssafSoundColor(.pointOrange)
    static let pointPurple = ssafSoundColor(.pointPurple)
    static let pointPurplePoint = ssafSoundColor(.pointPurplePoint)
    
    static let recruit = ssafSoundColor(.recruit)
    static let recruitLight = ssafSoundColor(.recruitLight)
    static let recruitPoint = ssafSoundColor(.recruitPoint)
    
    
    // MARK: - System
    static let darkgrey = ssafSoundColor(.darkgrey)
    static let grey = ssafSoundColor(.grey)
    static let lightgrey = ssafSoundColor(.lightgrey)

    
    // MARK: - 사용 금지
    static let ssafySoundblack = ssafSoundColor(.ssafySoundblack)
    static let whilte = ssafSoundColor(.whilte)
    
    static let bluegrey = ssafSoundColor(.fontBlueBlack)
    static let purplePoint = ssafSoundColor(.whilte)
}


public extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    static func ssafSoundColor(_ color: Colors) -> Color {
        guard let uiColor = UIColor(named: color.rawValue, in: Bundle.main, compatibleWith: nil) else {
            fatalError("No color named '\(color.rawValue)' found in asset catalog for module \(Bundle.main)")
        }
        return Color(uiColor)
    }
}

