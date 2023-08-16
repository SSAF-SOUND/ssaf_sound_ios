//
//  PostService.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/15.
//

import Foundation
import Moya

enum PostService {
    case posts(boardId: Int, cursor : Int, size : Int)
}

extension PostService: BaseTargetType {
    var path : String {
        switch self {
        case .posts:
            return SSAFSoundAPI.posts
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .posts:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .posts(let boardId, let cursor , let size):
            let parameters : [String : Any] = [
                "boardId" : boardId,
                "cursor" : cursor,
                "size" : size
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    
}
