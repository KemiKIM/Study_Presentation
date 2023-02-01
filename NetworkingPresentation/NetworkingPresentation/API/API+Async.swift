//
//  API+Async.swift
//  NetworkingPresentation
//
//  Created by 김성호 on 2023/01/30.
//

import UIKit

extension BaseAPI {
    
    static func asyncGet(page: Int) async throws -> TodosModelGeneric<Todo> {
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        guard let url = URL(string: urlString) else { throw ApiError.unknown(nil)}
        var urlRequest = URLRequest(url: url)
        
        
        
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        
        
        
        do {
            let (d, r) = try await URLSession.shared.data(for: urlRequest)
            
            let listResponse = try JSONDecoder().decode(TodosModelGeneric<Todo>.self, from: d)
            
            return listResponse
            
            
            
            
            guard let httpResponse = r as? HTTPURLResponse else {
                print("bad status code")
                throw ApiError.unknown(nil)
            }
            
            
            switch httpResponse.statusCode {
            case 401:
                throw Error.self as! Error
                
            default: print("default")
            }
            
            
            
            // 200
            if !(200...299).contains(httpResponse.statusCode) {
                throw ApiError.badStatus(code: httpResponse.statusCode)
            }
            
            
            
            
        } catch {
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            
            
            if let _ = error as? DecodingError {
                throw ApiError.unknown(error)
            }
            
            
            // Final Error
            throw ApiError.unknown(error)
        }
        
        
        
    }
    
    
    
}
