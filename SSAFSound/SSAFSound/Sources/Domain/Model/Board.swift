//
//  Board.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/10.
//

import Foundation
// MARK: - Welcome
struct BoardModel: Codable {
    let code, message: String?
    let data: BoardResponse?
}

// MARK: - DataClass
struct BoardResponse: Codable {
    let boards: [Board]?
}

// MARK: - Board
struct Board: Codable {
    let boardId: Int?
    let title: String?
    let imageUrl: String?
    let description: String?
}

