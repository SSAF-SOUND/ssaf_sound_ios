//
//  Comment.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/30.
//

import Foundation

struct CommentModel: Codable {
    let code, message: String?
    let data : CommentResponse?
}

struct CommentResponse: Codable {
    let comments: [Comments]
}

struct Comments: Codable {
    let commentId : Int
    let content: String
    let anonymity: Bool
    let likeCount: Int
    let liked: Bool
    let mine: Bool
    let createdAt: String
    let deletedComment: Bool
    let modified: Bool
    let author: Author?
    let replis: [Replis]?
}

struct Replis: Codable {
    let commentId : Int
    let content: String
    let anonymity: Bool
    let likeCount: Int
    let liked: Bool
    let mine: Bool
    let createdAt: String
    let deletedComment: Bool
    let modified: Bool
    let author: Author?
    let replis: [Replis]?
}
