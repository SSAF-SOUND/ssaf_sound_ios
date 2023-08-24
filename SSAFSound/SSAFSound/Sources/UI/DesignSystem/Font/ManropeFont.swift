//
//  ManropeFont.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation

import UIKit
import SwiftUI

public enum ManropeFontFontFamily: CustomStringConvertible {
    case Bold ,ExtraBold , ExtraLight, Light, Medium, Regular, SemiBold
    
    public var description: String {
        switch self {
        case .Bold:
            return "Bold"
        case .ExtraBold:
            return "ExtraBold"
        case .ExtraLight:
            return "ExtraLight"
        case .Light:
            return "Light"
        case .Medium:
            return "Medium"
        case .Regular:
            return "Regular"
        case .SemiBold:
            return "SemiBold"
        }
    }
}



public struct ManropeFont: ViewModifier {
    
    public var family: ManropeFontFontFamily
    public var size: CGFloat
    
    public func body(content: Content) -> some View {
        return content.font(.custom("Manrope-\(family)", fixedSize: size))
    }
}


public extension View {
    func manropeFont(family: ManropeFontFontFamily, size: CGFloat) -> some View {
        
        return self.modifier(ManropeFont(family: family, size: size))
    }
}

public extension UIFont {
    
    static func manropeFont(family: ManropeFontFontFamily, size: CGFloat) -> Font{

        let font = Font.custom("Manrope-\(family)", size: size)
        return font
    }
}

public extension Font {
    static let manropeRegualar40: Font = .custom("Manrope-Regualar", size: 40)
    static let manropeRegualar32: Font = .custom("Manrope-Regualar", size: 32)
    static let manropeRegualar28: Font = .custom("Manrope-Regualar", size: 28)
    static let manropeRegualar24: Font = .custom("Manrope-Regualar", size: 24)
    static let manropeRegualar20: Font = .custom("Manrope-Regualar", size: 20)
    static let manropeRegualar18: Font = .custom("Manrope-Regualar", size: 18)
    static let manropeRegualar16: Font = .custom("Manrope-Regualar", size: 16)
    static let manropeRegualar14: Font = .custom("Manrope-Regualar", size: 14)
    static let manropeRegualar12: Font = .custom("Manrope-Regualar", size: 12)
    static let manropeRegualar10: Font = .custom("Manrope-Regualar", size: 10)
    
    // Manrope Bold
    static let manropeBold40: Font = .custom("Manrope-Bold", size: 40)
    static let manropeBold32: Font = .custom("Manrope-Bold", size: 32)
    static let manropeBold28: Font = .custom("Manrope-Bold", size: 28)
    static let manropeBold24: Font = .custom("Manrope-Bold", size: 24)
    static let manropeBold20: Font = .custom("Manrope-Bold", size: 20)
    static let manropeBold18: Font = .custom("Manrope-Bold", size: 18)
    static let manropeBold16: Font = .custom("Manrope-Bold", size: 16)
    static let manropeBold14: Font = .custom("Manrope-Bold", size: 14)
    static let manropeBold12: Font = .custom("Manrope-Bold", size: 12)
    static let manropeBold10: Font = .custom("Manrope-Bold", size: 10)
    
    static func manropeFont(family: ManropeFontFontFamily, size: CGFloat) -> Font{
        let font = Font.custom("Manrope-\(family)", size: size)
        return font
    }
}


