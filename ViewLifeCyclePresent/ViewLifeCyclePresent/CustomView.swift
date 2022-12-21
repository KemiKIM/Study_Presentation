//
//  CustomView.swift
//  ViewLifeCyclePresent
//
//  Created by 김성호 on 2022/12/20.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    
    
    
    override func layoutSubviews() {
        layout1()
    }
    
    
    func layout1() {
        self.backgroundColor = .brown
    }
    
    
    
    
}
