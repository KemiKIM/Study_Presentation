//
//  BaseAPI.swift
//  NetworkingPresentation
//
//  Created by 김성호 on 2023/01/29.
//

import UIKit

enum BaseAPI {
    
    
    static let baseURL = "https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1"
    
    
    enum ApiError: Error {
        case badStatus(code: Int)
        case unknown(_ err: Error?)
        
        var info: String {
            switch self {
            case let .badStatus(code): return "에러 상태코드 \(code)"
            case .unknown(let err): return "알 수 없는 에러입니다."
            }
        }
        
    }
    
}
