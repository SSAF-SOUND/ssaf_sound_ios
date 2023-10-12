//
//  TechStackType.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/20.
//

import Foundation

enum TechStackType: String, CaseIterable , CustomStringConvertible, Identifiable {
    
    var id : String { UUID().uuidString }
    
    // MARK: - skills
    case react
    case javascript
    case nodejs
    
    case vue
    case xd
    case swift
    case figma
    
    case svelte
    case java
    case android
    
    case nextjs
    case spring
    case typescript
    
    case ios
    case flutter
    case django
    
    var description: String {
        switch self {
        case .react:
            return "React"
        case .javascript:
            return "JavaScript"
        case .nodejs:
            return "Nodejs"
        
        case .vue:
            return "Vue"
        case .xd:
            return "XD"
        case .swift:
            return "Swift"
        case .figma:
            return "Figma"
            
        case .svelte:
            return "Svelte"
        case .java:
            return "Java"
        case .android:
            return "Android"
        
        case .nextjs:
            return "Nextjs"
        case .spring:
            return "Spring"
        case .typescript:
            return "TypeScript"
        
        case .ios:
            return "iOS"
        case .flutter:
            return "Flutter"
        case .django:
            return "Django"
    }
    
    
//    var index: Int {
//        switch self {
//        case .portfolio:
//            return .zero
//        case .project:
//            return 1
//        case .study:
//            return 2
//        }
    }
}
