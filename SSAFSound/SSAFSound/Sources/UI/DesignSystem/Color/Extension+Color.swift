//
//  Extension+Color.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation
import SwiftUI


public extension Color {
    
    static let primaryDark = ssafSoundColor(.primaryDark)
    static let primaryDefault = ssafSoundColor(.primaryDefault)
    static let primaryPoint = ssafSoundColor(.primaryPoint)
    static let primaryStrong = ssafSoundColor(.primaryStrong)
    static let primarySub = ssafSoundColor(.primarySub)
    static let secondaryDefault = ssafSoundColor(.secondaryDefault)
    static let secondaryPoint = ssafSoundColor(.secondaryPoint)
    static let secondaryStrong = ssafSoundColor(.secondaryStrong)
    static let secondarySub = ssafSoundColor(.secondarySub)
    static let major = ssafSoundColor(.major)
    static let nonMajor = ssafSoundColor(.nonMajor)
    static let green = ssafSoundColor(.primaryDark)
    static let orange = ssafSoundColor(.orange)
    static let purple = ssafSoundColor(.primaryDark)
    static let purplePoint = ssafSoundColor(.purple)
    static let recruit = ssafSoundColor(.recruit)
    static let recruitLight = ssafSoundColor(.recruitLight)
    static let recruitPoint = ssafSoundColor(.recruitPoint)
    static let background = ssafSoundColor(.background)
    static let ssafySoundblack = ssafSoundColor(.ssafySoundblack)
    static let bluegrey = ssafSoundColor(.bluegrey)
    static let grey0 = ssafSoundColor(.grey0)
    static let grey1 = ssafSoundColor(.grey1)
    static let grey2 = ssafSoundColor(.grey2)
    static let grey3 = ssafSoundColor(.grey3)
    static let grey4 = ssafSoundColor(.grey4)
    static let grey = ssafSoundColor(.grey)
    static let lightgrey = ssafSoundColor(.lightgrey)
    static let whilte = ssafSoundColor(.whilte)

}


public extension Color {
    
    static func ssafSoundColor(_ color: Colors) -> Color {
        guard let uiColor = UIColor(named: color.rawValue, in: Bundle.main, compatibleWith: nil) else {
            fatalError("No color named '\(color.rawValue)' found in asset catalog for module \(Bundle.main)")
        }
        return Color(uiColor)
    }
}

