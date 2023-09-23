//
//  SkillModel.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/09/23.
//

import Foundation

// MARK: - Welcome
struct SkillModel: Codable {
    let code, message: String?
    let data: SkillResponseModel?
    
    public init(code: String?, message: String?, data: SkillResponseModel?) {
        self.code = code
        self.message = message
        self.data = data
    }
}

// MARK: - DataClass
struct SkillResponseModel: Codable {
    let skills: [Skill]?
    
    public init(skills: [Skill]?) {
        self.skills = skills
    }
}

// MARK: - Skill
struct Skill: Codable {
    let id: Int?
    let name: String?
    
    public init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}

