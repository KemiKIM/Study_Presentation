//
//  ViewController2.swift
//  NotificationEX
//
//  Created by 김성호 on 2023/01/17.
//

import UIKit

class ViewController2: UIViewController {

    
    static let noti = Notification.Name(rawValue: "noti")
    //static let notii = noti
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
    }
    
    
    
    
    
    @IBAction func tapped2(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: ViewController2.noti, object: nil)
        self.dismiss(animated: true)
        
    }

}
