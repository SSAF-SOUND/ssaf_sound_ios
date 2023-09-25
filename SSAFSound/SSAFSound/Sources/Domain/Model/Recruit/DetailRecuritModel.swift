//
//  DetailRecuritModel.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/09/23.
//

// MARK: - Welcome
struct DetailRecuritModel: Codable {
    let code, message: String?
    let data: DetailRecuritResponseModel?
}

// MARK: - DataClass
struct DetailRecuritResponseModel: Codable {
    let category: String?
    let recruitID: Int?
    let title, content: String?
    let contactURI: String?
    let view: Int?
    let finishedRecruit: Bool?
    let recruitStart, recruitEnd: String?
    let skills: [Skills]?
    let limits: [Limit]?
    let questions: [String]?
    let author: Author?
    let scrapCount: Int?
    let scraped: Bool?
    let matchStatus: String?

    enum CodingKeys: String, CodingKey {
        case category
        case recruitID = "recruitId"
        case title, content, contactURI, view, finishedRecruit, recruitStart, recruitEnd, skills, limits, questions, author, scrapCount, scraped, matchStatus
    }
}

// MARK: - Limit
struct Limit: Codable {
    let recruitType: String?
    let limit, currentNumber: Int?
}




