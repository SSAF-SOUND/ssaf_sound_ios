//
//  PostService.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/15.
//

import Foundation
import Moya

enum PostService {
    case postList(boardId: Int, cursor: Int, size: Int)
    case postDetail(postId: Int)
    case postCreate(boardId: Int, title: String, content: String, anoymity: Bool, images: [[String: String]]?)
}

extension PostService: BaseTargetType {
    var path: String {
        switch self {
        case .postList:
            return SSAFSoundAPI.posts
        case .postDetail(let postId):
            return "\(SSAFSoundAPI.posts)/\(postId)"
        case .postCreate:
            return SSAFSoundAPI.posts
        }
    }

    var method: Moya.Method {
        switch self {
        case .postList:
            return .get
        case .postDetail:
            return .get
        case .postCreate:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case .postList(let boardId, let cursor, let size):
            let parameters: [String: Any] = [
                "boardId": boardId,
                "cursor": cursor,
                "size": size
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .postDetail:
            return .requestPlain
        case .postCreate(boardId: let boardId, title: let title, content: let content, anoymity: let anonymity, images: let images):
            var parameters: [String: Any] = [
                "boardId": boardId,
                "title": title,
                "content": content,
                "anonymity": anonymity,
            ]
            
            // images가 값이 있다면 파라미터에 추가
               if let images = images, !images.isEmpty {
                   parameters["images"] = images
               }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }


}
