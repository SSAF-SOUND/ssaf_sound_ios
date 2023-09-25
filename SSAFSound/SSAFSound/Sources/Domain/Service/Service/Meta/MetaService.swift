//
//  MetaService.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/09/23.
//

import Foundation
import Moya

public enum MetaService {
    case campusListSearch
    case recruitsType
    case skillType
}


extension MetaService: BaseTargetType {
    public var path: String {
        switch self {
        case .campusListSearch:
            return SSAFSoundAPIMeta.campusListSearch
        case .recruitsType:
            return SSAFSoundAPIMeta.recruitsType
        case .skillType:
            return SSAFSoundAPIMeta.skillType
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .campusListSearch:
            return .get
        case .recruitsType:
            return .get
        case .skillType:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .campusListSearch:
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .recruitsType:
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .skillType:
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
}
