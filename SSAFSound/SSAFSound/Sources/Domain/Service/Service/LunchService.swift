//
//  LunchService.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/21.
//

import Foundation
import Moya

enum LunchService {
    case lunchs(date: String, campus: String)
}

extension LunchService: BaseTargetType {
    var path: String {
        switch self {
        case .lunchs:
            return SSAFSoundAPI.lunchs
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .lunchs:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .lunchs(let date, let campus):
            let parameters : [String : Any] = [
                "date" : date,
                "campus" : campus
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
}
