//
//  API+URLSessionShared.swift
//  NetworkingPresentation
//
//  Created by 김성호 on 2023/01/29.
//

import UIKit

extension BaseAPI {
    
    static func uSharedGet(page: Int, completion: @escaping (Result<TodosModelGeneric<Todo>, Error>) -> Void) {
        
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        guard let url = URL(string: urlString) else { return
            completion(.failure(Error.self as! Error))}
        var urlRequest = URLRequest(url: url)
        
        
        
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
       
        
        
        
        URLSession.shared.dataTask(with: urlRequest) { d, r, e in
            
            
            
            // (1) data
            if let jsonData = d {
                do {

                    
                    let jsonResponse = try JSONDecoder().decode(TodosModelGeneric<Todo>.self, from: jsonData)
                    let todos = jsonResponse.data

                    
                    
                    guard let todos = todos, !todos.isEmpty else {
                        return completion(.failure(Error.self as! Error))
                    }
                    
                   
                    completion(.success(jsonResponse))
                } catch {

                    completion(.failure(ApiError.unknown(error)))
                }
            }
            
            
            
            // (2) response
            guard let httpResponse = r as? HTTPURLResponse else {
                print("fetchTodos - bad status code")
   
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(Error.self as! Error))
                
            default: print("fetchTodos - httpResponse.statusCode: default")
            }
            
            
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            
            
            
            // (3) error
            if let error = e {
                return completion(.failure(ApiError.unknown(error)))
            }
            
        }.resume()
        
        
    }
}
