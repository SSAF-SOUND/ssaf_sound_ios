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
    case  test
}

//
//
//public enum AuthorziationService {
//    case login(deviceId: String, userId: String, passWord: String)
//}
//
//extension AuthorziationService : BaseTargetType {
//   
//    
//    public var path: String {
//        switch self {
//        case .login:
//            return ChaeviUSAPI.loginURL
//        }
//    }
//    
//    public var method: Moya.Method {
//        switch self {
//        case .login:
//            return .post
//        }
//    }
//    
//    public var task: Moya.Task {
//        switch self {
//        case .login(let deviceId, let userId, let passWord):
//            let parameters : [String : Any] = [
//                "deviceId" : deviceId,
//                "userId" : userId,
//                "passWord" : passWord
//            ]
//            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
//        }
//    }
//}
