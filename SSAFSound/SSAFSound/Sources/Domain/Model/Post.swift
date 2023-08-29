//
//  Post.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/15.
//

import Foundation

struct PostModel: Codable {
    let code, message: String?
    let data: PostResponse?
}

struct PostResponse: Codable {
    let posts: [Post]?
}

struct Post: Codable , Identifiable {
    let id = UUID().uuidString
    let boardId: Int?
    let boardTitle: String?
    let postId: Int?
    let title: String?
    let content: String?
    let likeCount: Int?
    let commentCount: Int?
    let createdAt: String?
    let nickname: String?
    let anonymity: Bool?
    let thumbnail: String?
    let cursor : Int?
}
