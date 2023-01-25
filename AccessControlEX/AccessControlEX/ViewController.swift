//
//  ViewController.swift
//  AccessControlEX
//
//  Created by 김성호 on 2023/01/25.
//


// (1) open
import UIKit




// (3) class 앞, 즉 대부분의 keyword 앞에 생략되어 있음.
// internal class ViewController: UIViewController {
class ViewController: UIViewController {

    
    
    // (2) String 은 public에 해당됨.
    var ex1: String = "ex1"
    
    
    
    
    // (4) fileprivate
    fileprivate let ex2: String = "ex2"
    
    
    // (5) private
    private let ex3: String = "ex3"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    // internal func ex4() {
    func ex4() {
        // public let ex5 = "12"
        // 접근 수준에 대한 내용.
    }
    
    
    

}

