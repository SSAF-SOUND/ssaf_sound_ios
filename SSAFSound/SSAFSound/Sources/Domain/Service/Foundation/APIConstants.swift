//
//  APIConstants.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/08/03.
//

import Foundation


struct APIConstants{
    static var viewModel: BoardViewModel = BoardViewModel()
    static let contentType = "Content-Type"
    static let host = "Host"
    static let Cookie = "Cookie"
    
}

extension APIConstants {
    static var baseHeader: Dictionary<String, String> {
        [
            contentType : APIHeaderManger.shared.contentType,
            host : APIHeaderManger.shared.ssafHost,
            Cookie : "accessToken=\(viewModel.authCodeToken)"
        ]
    }
}

