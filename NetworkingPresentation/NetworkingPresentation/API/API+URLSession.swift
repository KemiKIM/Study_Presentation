//
//  API+URLSession.swift
//  NetworkingPresentation
//
//  Created by 김성호 on 2023/01/29.
//

import UIKit

extension BaseAPI {
    
    static func urlSessionGet(page: Int, completion: @escaping (Result<TodosModelGeneric<Todo>, Error>) -> Void) {
        // (1) URLSessionConfiguration 생성 (세 가지 존재): .default / .ephemeral / .background
        let configDefault = URLSessionConfiguration.default
        let configEphemral = URLSessionConfiguration.ephemeral
        let configBackground = URLSessionConfiguration.background(withIdentifier: "identifier")
        
        let sessionDefault = URLSession(configuration: configDefault)
        let sessionEphemral = URLSession(configuration: configEphemral)
        let sessionBackground = URLSession(configuration: configBackground)
        
        
        // (2) Task 3가지 작업 유형 : data, upload, download
        
        // sessionDefault.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        // sessionEphemral.uploadTask(with: <#T##URLRequest#>, from: <#T##Data#>)
        // sessionBackground.downloadTask(with: <#T##URLRequest#>)
        
        
        
        
        
        
        
        
        
        
        // 사용
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        guard let url = URL(string: urlString) else { return
            completion(.failure(Error.self as! Error))}
        var urlRequest = URLRequest(url: url)
        
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        
        
        let dataTask = session.dataTask(with: urlRequest) { d, r, e in
            //(1) data
            guard let resultData = d else { return }
            
            guard let json = (try? JSONSerialization.jsonObject(with: resultData, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String : Any] else { return }
            print(json)
            
            //(2) response
            let successRange = 200..<300
            guard let statusCode = (r as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else { return }

            
            //(3) error
            guard e == nil else { return }

        }
        
        
        dataTask.resume()
    }
    
    
}
