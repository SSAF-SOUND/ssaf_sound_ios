//
//  RecruitSertvice.swift
//  SSAFSound
// SSAFSoundAPIRecruit
//  Created by 서원지 on 2023/09/23.
//

import Foundation
import Moya

public enum RecruitSertvice {
    case recruitsListSearch(cursor: Int, category: String, keyword: String, isFinished: String, recruitTypes: [String], skills: [String], size: Int)
    case recuritScrap(recruitId: String)
    case deleteRecurit(recruitId: String)
    case detailRecurit(recruitId: String)
    case recuritComplete(recruitId: String)
    case recuritUpdate(category: String, registerRecruitType: String, recruitEnd: String, title: String, content: String, contactURI: String, skills: [String], limitations: [String])
    
}


extension RecruitSertvice: BaseTargetType {
    public var path: String {
        switch self {
        case .recruitsListSearch:
            return SSAFSoundAPIRecruit.recruitsListSearch
        case .recuritScrap(let recruitId):
            return "\(SSAFSoundAPIRecruit.recuritScrap)\(recruitId)/scrap"
        case .deleteRecurit(let recruitId):
            return "\(SSAFSoundAPIRecruit.deleteRecurit)\(recruitId)"
        case .detailRecurit(let recruitId):
            return "\(SSAFSoundAPIRecruit.detailRecurit)\(recruitId)"
        case .recuritComplete(let recruitId):
            return "\(SSAFSoundAPIRecruit.recuritComplete)\(recruitId)/expired"
        case .recuritUpdate:
            return SSAFSoundAPIRecruit.recuritUpdate
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .recruitsListSearch:
            return .get
        case .recuritScrap:
            return .post
        case .deleteRecurit:
            return .delete
        case .detailRecurit:
            return .get
        case .recuritComplete:
            return .post
        case .recuritUpdate:
            return .patch
                                
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .recruitsListSearch(let cursor, let category, let keyword, let isFinished, let recruitTypes, let skills, let size):
            let parameters : [String : Any] = [
                "cursor": cursor,
                "category" : category,
                "keyword" : keyword,
                "isFinished" : isFinished,
                "recruitTypes" : recruitTypes,
                "skills" : skills,
                "size" : size
                ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .recuritScrap:
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .deleteRecurit:
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .detailRecurit:
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        case .recuritComplete:
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recuritUpdate(let category, let registerRecruitType, let recruitEnd, let title, let content, let contactURI, let skills, let limitations):
            let parameters : [String : Any] = [
                "category": category,
                "registerRecruitType": registerRecruitType,
                "recruitEnd": recruitEnd,
                "title": title,
                "content": content,
                "contactURI": contactURI,
                "skills" : skills,
                "limitations" : limitations.map { $0 }
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
}
