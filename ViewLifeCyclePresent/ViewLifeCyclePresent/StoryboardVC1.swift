//
//  StroyboardVC1.swift
//  ViewLifeCyclePresent
//
//  Created by 김성호 on 2022/12/20.
//

import Foundation
import UIKit

class StoryboardVC1: UIViewController {
    
    
    override func loadView() {
        super.loadView()
        //view = CustomView()
        print("StoryBoard loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("StoryBoard viewdidLoad")
    }
    
    
    
    
}
