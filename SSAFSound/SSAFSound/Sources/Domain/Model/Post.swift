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
    let cursor : Int?
}

struct PostResponse: Codable {
    let posts: [PostList]?
    let post : PostDetail?
}

struct PostList: Codable  {
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
    
}

struct PostDetail: Codable {
    // post
    let boardId : Int?
    let boardTitle : String?
    let postId : Int?
    let title: String?
    let content: String?
    let likeCount: Int?
    let commentCount: Int?
    let scrapCount: Int?
    let createdAt: String?
    let anonymity: Bool?
    let modified: Bool?
    let scraped: Bool?
    let liked: Bool?
    let mine: Bool?
    let images: [ImageUrl]?
    let author : Author?
}

struct ImageUrl : Codable {
    let imageUrl : String?
}

struct Author : Codable {
    let memberId : Int?
    let nickname: String?
    let memberRole: String?
    let isMajor: Bool?
    let ssafyMember: Bool?
    let ssafyInfo : SsafyInfo?
}

struct SsafyInfo : Codable {
    let semester: Int?
    let campus: String?
    let certificationState: String?
    let majorTrack: String?
}
