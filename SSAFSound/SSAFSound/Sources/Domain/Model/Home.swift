//
//  Home.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/08/03.
//


import Foundation

// MARK: - Welcome
struct RecuritModel: Codable {
    let code, message: String?
    let data: RecuritResponse?
}

// MARK: - DataClass
struct RecuritResponse: Codable {
    let recruits: [Recruit]?
    let currentPage, totalPages: Int?
    let lastPage: Bool?
}

// MARK: - Recruit
struct Recruit: Codable {
    let recruitID: Int?
    let title: String?
    let finishedRecruit: Bool?
    let recruitEnd: String?
    let content: String?
    let skills: [Skill]?
    let participants: [Participant]?

    enum CodingKeys: String, CodingKey {
        case recruitID = "recruitId"
        case title, finishedRecruit, recruitEnd, content, skills, participants
    }
}


// MARK: - Participant
struct Participant: Codable {
    let recruitType: String?
    let limit: Int?
    let members: [Member]?
}

// MARK: - Member
struct Member: Codable {
    let nickName: String?
    let major: Bool?
}

// MARK: - Skill
struct Skill: Codable {
    let skillID: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case skillID = "skillId"
        case name
    }
}

