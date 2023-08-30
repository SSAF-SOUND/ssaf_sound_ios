//
//  CommentService.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/30.
//

import Foundation
import Moya

enum CommentService {
    case commentList(postId: Int)
}

extension CommentService: BaseTargetType {
    var path : String {
        switch self {
        case .commentList:
            return SSAFSoundAPI.comments
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .commentList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .commentList(let postId):
            let parameters : [String : Any] = [
                "postId" : postId,
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    
}

