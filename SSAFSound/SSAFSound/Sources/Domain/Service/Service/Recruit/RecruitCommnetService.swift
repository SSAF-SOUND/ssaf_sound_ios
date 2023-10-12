//
//  RecruitCommnetService.swift
//  SSAFSound
//
//  Created by 서원지 on 10/12/23.
//

import Foundation
import Moya

enum RecruitCommnetService {
    case addRecruitCommnet(recruitId: String)
    case deleteRecruitCommnet(recruitId: String)
    case recruitCommnet(recruitCommentId: String)
    case recruitCommnetLike(recruitCommentId: String)
    case recruitUpdateCommnet(recruitId: String)
}


extension RecruitCommnetService: BaseTargetType {
    var path: String {
        switch self {
        case .addRecruitCommnet(let recruitId):
            return "\(SSAFSoundAPIRecruitCommnet.addRecruitCommnet)\(recruitId)/comments"
        case .deleteRecruitCommnet(let recruitId):
            return "\(SSAFSoundAPIRecruitCommnet.addRecruitCommnet)\(recruitId)"
        case .recruitCommnet(let recruitCommentId):
            return "\(SSAFSoundAPIRecruitCommnet.updateRecruitCommnet)\(recruitCommentId)"
        case .recruitCommnetLike(let recruitCommentId):
            return "\(SSAFSoundAPIRecruitCommnet.recruitCommnetLike)\(recruitCommentId)"
        case .recruitUpdateCommnet(let recruitId):
            return "\(SSAFSoundAPIRecruitCommnet.recruitUpdateCommnet)\(recruitId)/comments"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addRecruitCommnet:
            return .post
        case .deleteRecruitCommnet:
            return .delete
        case .recruitCommnet:
            return .patch
        case .recruitCommnetLike:
            return .post
        case .recruitUpdateCommnet:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .addRecruitCommnet(let recruitId):
            let parameters : [String : Any] = [
                "recruitId": recruitId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .deleteRecruitCommnet(let recruitId):
            let parameters : [String : Any] = [
                "recruitId": recruitId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitCommnet(let recruitCommentId):
            let parameters : [String : Any] = [
                "recruitCommentId": recruitCommentId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitCommnetLike(let recruitCommentId):
            let parameters : [String : Any] = [
                "recruitCommentId": recruitCommentId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitUpdateCommnet(let recruitId):
            let parameters : [String : Any] = [
                "recruitId": recruitId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
}
