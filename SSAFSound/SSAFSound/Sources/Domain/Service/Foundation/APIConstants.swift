//
//  APIConstants.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/08/03.
//

import Foundation


struct APIConstants{
    
    static let contentType = "Content-Type"
    static let appPackageName = "App-Package-Name"
    static let apikey =  "apikey"
    
}

extension APIConstants {
    static var baseHeader: Dictionary<String, String> {
        [
          contentType : APIHeaderManger.shared.contentType
        ]
    }
}

