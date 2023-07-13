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
     public func manropeFont(family: ManropeFontFontFamily, size: CGFloat) -> some View {
         return self.modifier(ManropeFont(family: family, size: size))
    }
}

public extension UIFont {
    public static func manropeFont(family: ManropeFontFontFamily, size: CGFloat) -> Font{
        let font = Font.custom("Manrope-\(family)", size: size)
        return font
    }
}

public extension Font {
    public static func manropeFont(family: ManropeFontFontFamily, size: CGFloat) -> Font{
        let font = Font.custom("Manrope-\(family)", size: size)
        return font
    }
}
