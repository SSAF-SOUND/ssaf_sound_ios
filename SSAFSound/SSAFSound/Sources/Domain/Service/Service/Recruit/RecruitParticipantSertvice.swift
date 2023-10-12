//
//  RecruitParticipantService.swift
//  SSAFSound
//
//  Created by 서원지 on 10/12/23.
//

import Foundation
import Moya


enum RecruitParticipantService {
    case joinRecruit(recruitId: String)
    case joinRecruitAccept(recruitApplicationId: String)
    case recruitReject(recruitApplicationId: String)
    case recruitCancel(recruitApplicationId: String)
    case recruitMemberList(recruitId: String)
    case recruitJoinMemberList(recruitId: String)
    case recruitJoinMemberLike(recruitApplicationId: String)
    case recruitJoinMemberDetail(recruitApplicationId: String)
    case recruitRejectMemberList(recruitId: String)
    case recruitApplicationinquiry(recruitId: String)
    
}


extension RecruitParticipantService: BaseTargetType {
    var path: String {
        switch self {
        case .joinRecruit(let recruitId):
            return "\(SSAFSoundAPIRecruitParticipant.recruitsParticipan)\(recruitId)/application"
        case .joinRecruitAccept(let recruitApplicationId):
            return"\(SSAFSoundAPIRecruitParticipant.recruitsParticipanApprove)\(recruitApplicationId)/approve"
        case .recruitReject(let recruitApplicationId):
            return"\(SSAFSoundAPIRecruitParticipant.recruitsRejection)\(recruitApplicationId)/reject"
        case .recruitCancel(let recruitApplicationId):
            return "\(SSAFSoundAPIRecruitParticipant.recruitsApplicantCancel)\(recruitApplicationId)/cancel"
        case .recruitMemberList(let recruitId):
            return "\(SSAFSoundAPIRecruitParticipant.recruitsApplicantJoinMember)\(recruitId)/members"
        case .recruitJoinMemberList:
            return SSAFSoundAPIRecruitParticipant.recruitsApplicantJoinMember
        case .recruitJoinMemberLike(let recruitApplicationId):
            return "\(SSAFSoundAPIRecruitParticipant.recruitsApplicantJoinlike)\(recruitApplicationId)/like"
        case .recruitJoinMemberDetail(let recruitApplicationId):
            return "\(SSAFSoundAPIRecruitParticipant.recruitsApplicantDetail)\(recruitApplicationId)"
        case .recruitRejectMemberList(let recruitId):
            return SSAFSoundAPIRecruitParticipant.recruitsApplicantDetail
        case .recruitApplicationinquiry:
            return SSAFSoundAPIRecruitParticipant.recruitApplicationinquiry
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .joinRecruit:
            return .post
        case .joinRecruitAccept:
            return .patch
        case .recruitReject:
            return .patch
        case .recruitCancel:
            return .patch
        case .recruitMemberList:
            return .get
        case .recruitJoinMemberList:
            return .get
        case .recruitJoinMemberLike:
            return .post
        case .recruitJoinMemberDetail:
            return .get
        case .recruitRejectMemberList:
            return .get
        case .recruitApplicationinquiry:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .joinRecruit(let recruitId):
            let parameters : [String : Any] = [
                "recruitId": recruitId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .joinRecruitAccept(let recruitApplicationId):
            let parameters : [String : Any] = [
                "recruitApplicationId": recruitApplicationId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitReject(let recruitApplicationId):
            let parameters : [String : Any] = [
                "recruitApplicationId": recruitApplicationId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitCancel(let recruitApplicationId):
            let parameters : [String : Any] = [
                "recruitApplicationId": recruitApplicationId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitMemberList(let recruitId):
            let parameters : [String : Any] = [
                "recruitId": recruitId
                ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        case .recruitJoinMemberList(let recruitId):
            let parameters : [String : Any] = [
                "recruitId": recruitId
                ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        case .recruitJoinMemberLike(let recruitApplicationId):
            let parameters : [String : Any] = [
                "recruitApplicationId": recruitApplicationId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitJoinMemberDetail(let recruitApplicationId):
            let parameters : [String : Any] = [
                "recruitApplicationId": recruitApplicationId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitRejectMemberList(let recruitId):
            let parameters : [String : Any] = [
                "recruitId": recruitId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .recruitApplicationinquiry(let recruitId):
            let parameters : [String : Any] = [
                "recruitId": recruitId
                ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
}
