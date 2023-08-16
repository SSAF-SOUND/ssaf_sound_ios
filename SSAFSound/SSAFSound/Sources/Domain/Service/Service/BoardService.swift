//
//  BoardService.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/08/03.
//

import Foundation
import Moya

enum BoardService {
    //MARK: -   해당 url 을  케이스 로 만든후 구현
    case recruits(cursor: Int, category: String, keyword: String, isFinished: String, recruitTypes: String, skills: String)
}


extension BoardService: BaseTargetType {
    
    var path: String {
        switch self {
        case .recruits:
            return SSAFSoundAPI.recruits
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recruits:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .recruits(let cursor, let category, let keyword, let isFinished, let recruitTypes, let skills):
            let parameters : [String : Any] = [
                "cursor": cursor,
                "category" : category,
                "keyword" : keyword,
                "isFinished" : isFinished,
                "recruitTypes" : recruitTypes,
                "skills" : skills
                ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
}
