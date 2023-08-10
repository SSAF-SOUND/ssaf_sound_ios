//
//  BoardService2.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/10.
//

import Foundation
import Moya

enum BoardService2 {
    //MARK: -   해당 url 을  케이스 로 만든후 구현
    case boards
}


extension BoardService2: BaseTargetType {
    
    var path: String {
        switch self {
        case .boards:
            return SSAFSoundAPI.boards
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .boards:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .boards:
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
}
