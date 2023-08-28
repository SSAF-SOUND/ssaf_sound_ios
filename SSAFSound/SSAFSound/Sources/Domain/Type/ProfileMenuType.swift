//
//  ProfileMenuType.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/26.
//

enum ProfileMenuType: CaseIterable , CustomStringConvertible {
    case portfolio
    case project
    case study
    
    
    var description: String {
        switch self {
        case .portfolio:
            return "포트폴리오"
        case .project:
            return "프로젝트"
        case .study:
            return "스터디"
        }
    }
    
    
    var index: Int {
        switch self {
        case .portfolio:
            return .zero
        case .project:
            return 1
        case .study:
            return 2
        }
    }
}
