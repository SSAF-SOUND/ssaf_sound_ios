//
//  PretendardFont.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/21.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Pretendard

public enum PretendardFontFamily: CustomStringConvertible {
    case Bold, Regular
    
    public var description: String {
        switch self {
        case .Bold:
            return "Bold"
        case .Regular:
            return "Regular"
        }
    }
}

public struct PretendardFont: ViewModifier {
    public var family: PretendardFontFamily
    public var size: CGFloat

    public func body(content: Content) -> some View {
        return content.font(.custom("Pretendard-\(family)", fixedSize: size))
    }
}


public extension View {
    func pretendardFont(family: PretendardFontFamily, size: CGFloat) -> some View {
        return self.modifier(PretendardFont(family: family, size: size))
    }
}

public extension UIFont {
    static func pretendardFont(family: PretendardFontFamily, size: CGFloat) -> Font{
        let font = Font.custom("Pretendard-\(family)", size: size)
        return font
    }
}

public extension Font {
    //쌉사운드 B/40
    //쌉사운드 B/32
    //쌉사운드 B/28
    //쌉사운드 B/24
    //쌉사운드 B/20
    //쌉사운드 B/18
    //쌉사운드 B/16
    //쌉사운드 B/14
    //쌉사운드 B/12
    //쌉사운드 B/10

    // Manrope Regular
    static let pretendardRegualar40: Font = .custom("Pretendard-Regualar", size: 40)
    static let pretendardRegualar32: Font = .custom("Pretendard-Regualar", size: 32)
    static let pretendardRegualar28: Font = .custom("Pretendard-Regualar", size: 28)
    static let pretendardRegualar24: Font = .custom("Pretendard-Regualar", size: 24)
    static let pretendardRegualar20: Font = .custom("Pretendard-Regualar", size: 20)
    static let pretendardRegualar18: Font = .custom("Pretendard-Regualar", size: 18)
    static let pretendardRegualar16: Font = .custom("Pretendard-Regualar", size: 16)
    static let pretendardRegualar14: Font = .custom("Pretendard-Regualar", size: 14)
    static let pretendardRegualar12: Font = .custom("Pretendard-Regualar", size: 12)
    static let pretendardRegualar10: Font = .custom("Pretendard-Regualar", size: 10)
    
    // Manrope Bold
    static let pretendardBold40: Font = .custom("Pretendard-Bold", size: 40)
    static let pretendardBold32: Font = .custom("Pretendard-Bold", size: 32)
    static let pretendardBold28: Font = .custom("Pretendard-Bold", size: 28)
    static let pretendardBold24: Font = .custom("Pretendard-Bold", size: 24)
    static let pretendardBold20: Font = .custom("Pretendard-Bold", size: 20)
    static let pretendardBold18: Font = .custom("Pretendard-Bold", size: 18)
    static let pretendardBold16: Font = .custom("Pretendard-Bold", size: 16)
    static let pretendardBold14: Font = .custom("Pretendard-Bold", size: 14)
    static let pretendardBold12: Font = .custom("Pretendard-Bold", size: 12)
    static let pretendardBold10: Font = .custom("Pretendard-Bold", size: 10)
}


