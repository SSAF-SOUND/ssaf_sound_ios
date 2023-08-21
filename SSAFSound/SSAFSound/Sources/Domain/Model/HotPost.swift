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
    let data: HotPostResponse
}

// MARK: - HostPostResponse
struct HotPostResponse: Codable {
    let posts: [HotPost]
    let cursor: JSONNull?
}

// MARK: - Post
struct HotPost: Codable {
    let boardID: Int
    let boardTitle: String
    let postID: Int
    let title, content: String
    let likeCount, commentCount: Int
    let createdAt, nickname: String
    let anonymity: Bool
    let thumbnail: JSONNull?

    enum CodingKeys: String, CodingKey {
        case boardID = "boardId"
        case boardTitle
        case postID = "postId"
        case title, content, likeCount, commentCount, createdAt, nickname, anonymity, thumbnail
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
