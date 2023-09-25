//
//  APIHeaderManger.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation

public class APIHeaderManger {
    
    static let shared = APIHeaderManger()
    
    
    
    let contentType: String = "application/json"
    let ssafHost: String = "api.ssafsound.com"
}
