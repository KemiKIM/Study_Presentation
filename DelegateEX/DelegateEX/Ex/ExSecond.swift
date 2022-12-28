//
//  ExSecond.swift
//  DelegateEX
//
//  Created by 김성호 on 2022/12/27.
//


import Foundation
import UIKit


protocol MeProtocol: AnyObject {
    func getWater()
}

class Me {
    weak var delegateHon: Hon?
    weak var delegateJunyeon: Junyeon?
    
    func giveMeWater() {
        delegateHon?.getWater()
        delegateJunyeon?.getWater()
    }
}


class Hon: MeProtocol {
    let me = Me()
    
    init() {
        me.delegateHon = self
    }
    
    func getWater() {
        print("물을 샀다.")
    }
}


class Junyeon: MeProtocol {
    let me = Me()
    
    init() {
        me.delegateJunyeon = self
    }
    
    func getWater() {
        print("물을 샀다.")
    }
}

