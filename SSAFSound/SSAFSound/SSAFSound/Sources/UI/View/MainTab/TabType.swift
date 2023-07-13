//
//  MainTabType.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation

enum MainTabType: String, CaseIterable, CustomStringConvertible  {
    case home
    case board
    case recruit
    case profile
    
    var description: String {
        switch self {
        case .home:
            return "홈"
        case .board:
            return "게시판"
        case .recruit:
            return "리크루트"
        case .profile:
            return "프로필"
        }
    }
    
    var index: Int {
        switch self {
        case .home:
            return .zero
        case.board:
            return 1
        case .recruit:
            return 2
        case .profile:
            return 3
            
        }
    }
}
