//
//  ViewController.swift
//  selfvsSelf
//
//  Created by 김성호 on 2023/01/04.
//

import UIKit


// self (1)
// GiftViewController - 40
// HomeSegment - 13





// self (2)
struct ExNumber {
    var number: Int = 0
    
    // 값 타입에서 저장속성을 변경하는 것이기 때문에 mutating
    mutating func plusNum(_ num: Int) {
        number += num
    }
    
    mutating func reset() {
        self = ExNumber()
    }
    
}



// self (3)
struct MyStruct {
    static let club = "IOS부서"
    static func doPrinting() {
        print("소속은 \(self.club)입니다.")
    }
}



class ViewController: UIViewController {

    
    var team: String = "MU"
    var player: String = "JI SUNG PARK"
    var uniformNumber: Int = 13
    //var iSay: String = "i like" + self.uniformNumber + self.player + self.team
    
 
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    

}

