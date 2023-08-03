//
//  BaseTargetType.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/08/03.
//

import Foundation
import Moya

public protocol BaseTargetType: TargetType {}


extension BaseTargetType {
    public var baseURL: URL {
        return URL(string: SSAFSoundAPI.baseURL)!
    }
    
    public var headers: [String : String]? {
        return APIConstants.baseHeader
    }
    
}

