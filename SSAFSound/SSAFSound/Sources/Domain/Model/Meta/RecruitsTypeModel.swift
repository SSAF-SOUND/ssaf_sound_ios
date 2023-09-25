//
//  RecruitsTypeModel.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/09/23.
//

import Foundation

// MARK: - Welcome
 struct RecruitsTypeModel: Codable {
    let code, message: String?
    let data: RecruitsTypeResponseModel?
     
     public init(code: String?, message: String?, data: RecruitsTypeResponseModel?) {
         self.code = code
         self.message = message
         self.data = data
     }
}

// MARK: - DataClass
struct RecruitsTypeResponseModel: Codable {
    let recruitTypes: [RecruitType]?
    
    public init(recruitTypes: [RecruitType]?) {
        self.recruitTypes = recruitTypes
    }
}

// MARK: - RecruitType
struct RecruitType: Codable {
    let id: Int?
    let name: String?
    
    public init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
