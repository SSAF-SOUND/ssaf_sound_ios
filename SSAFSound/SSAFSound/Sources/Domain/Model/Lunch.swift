//
//  Lunch.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/21.
//

import Foundation

// MARK: - Welcome
struct LunchModel: Codable {
    let code, message: String
    let data: Object
}

// MARK: - DataClass
struct Object: Codable {
    let totalPollCount, polledAt: Int
    let menus: [Menu]
}

// MARK: - Menu
struct Menu: Codable {
    let lunchID: Int
    let mainMenu, extraMenu, sumKcal: String
    let imagePath: String
    let pollCount: Int

    enum CodingKeys: String, CodingKey {
        case lunchID = "lunchId"
        case mainMenu, extraMenu, sumKcal, imagePath, pollCount
    }
}
