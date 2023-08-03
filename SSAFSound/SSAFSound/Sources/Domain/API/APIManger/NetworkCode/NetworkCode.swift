//
//  NetworkCode.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation

public enum NetworkCode: String , CustomStringConvertible{
    case sucess
    case netWorkError
    case userError
    case serverError
    
    public var description: String {
        switch self {
        case .sucess:
            return "200"
        case.userError:
            return "201"
        case .netWorkError:
            return "400"
        case .serverError:
            return "500"
        }
    }
}

