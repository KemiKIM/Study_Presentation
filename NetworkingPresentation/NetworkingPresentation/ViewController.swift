//
//  ViewController.swift
//  NetworkingPresentation
//
//  Created by 김성호 on 2023/01/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // urlsession()
        // urlsessionShared()
        // asyncGet()
    }
    
    
    func urlsession() {
        BaseAPI.urlSessionGet(page: 1) { result in
            
            
            switch result {
            case .success(let s):
                print("urlSessionGet s: \(s)")
            case .failure(let f):
                print(f)
            }
        }
    }
    
    
    func urlsessionShared() {
        BaseAPI.uSharedGet(page: 1) { result in
            switch result {
            case .success(let s):
                print("uSharedGet s: \(s)")
            case .failure(let f):
                print(f)
            }
        }
    }
    
    
    func asyncGet() {
        Task {
            
            do {
                let r = try await BaseAPI.asyncGet(page: 1)
                print("asyncGet r : \(r)")
            } catch {
                print("error")
            }
            
            
        }
    }
    
    
    
    
    

}

