//
//  RecruitStudyType.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/18.
//

import Foundation

enum RecruitStudyType: CaseIterable , CustomStringConvertible {
    case project
    case study
    
    
    var description: String {
        switch self {
        case .project:
            return "프로젝트"
        case .study:
            return "스터디"
        }
    }
    
    
    var index: Int {
        switch self {
        case .project:
            return .zero
        case .study:
            return 1
        }
    }
}
