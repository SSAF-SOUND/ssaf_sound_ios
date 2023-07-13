//
//  Extension+Color.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation
import SwiftUI


public extension Color {
    
    
}


public extension Color {
    
    static func ssafSoundColor(_ color: Colors) -> Color {
        guard let uiColor = UIColor(named: color.rawValue, in: Bundle.main, compatibleWith: nil) else {
            fatalError("No color named '\(color.rawValue)' found in asset catalog for module \(Bundle.main)")
        }
        return Color(uiColor)
    }
}

