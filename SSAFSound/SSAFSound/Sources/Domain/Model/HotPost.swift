//
//  HotPost.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


// MARK: - Welcome
struct HotPostModel: Codable {
    let code, message: String?
    let data: HotPostResponse?
}

// MARK: - HostPostResponse
struct HotPostResponse: Codable {
    let posts: [HotPost]
    let cursor: Int?
}

// MARK: - Post
struct HotPost: Codable {
    let boardId: Int
    let boardTitle: String
    let postId: Int
    let title, content: String
    let likeCount, commentCount: Int
    let createdAt, nickname: String
    let anonymity: Bool
    let thumbnail: String?
}


