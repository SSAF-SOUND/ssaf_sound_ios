//
//  HotPostService.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/20.
//

import Foundation
import Moya

enum HotPostService {
    case hotPost(cursor: Int, size: Int)
}

extension HotPostService: BaseTargetType {
    
    
    var path: String {
        switch self {
        case .hotPost:
            return SSAFSoundAPI.hotposts
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .hotPost:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .hotPost(let cursor, let size):
            let parameters : [String : Any] = [
                "cursor" : cursor,
                "size" : size
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
}
