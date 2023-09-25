//
//  CampusesModel.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/09/23.
//

import Foundation

// MARK: - Welcome
struct CampusesModel: Codable {
    let code, message: String?
    let data: CampusesResponseModel?
    
    public init(code: String?, message: String?, data: CampusesResponseModel?) {
        self.code = code
        self.message = message
        self.data = data
    }
}

// MARK: - DataClass
struct CampusesResponseModel: Codable {
    let campuses: [Campus]?
    
    public init(campuses: [Campus]?) {
        self.campuses = campuses
    }
}

// MARK: - Campus
struct Campus: Codable {
    let id: Int?
    let name: String?
    
    public init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
