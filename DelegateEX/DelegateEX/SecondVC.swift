//
//  SecondVC.swift
//  DelegateEX
//
//  Created by 김성호 on 2022/12/27.
//

import UIKit

protocol VCProtocol: AnyObject {
    func saveName(name: String)
}

class SecondVC: UIViewController {
    weak var delegate: VCProtocol?
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    @IBAction func saveNameAction(_ sender: Any) {
        delegate?.saveName(name: self.textField.text ?? "")
        self.dismiss(animated: true)
    }
    
}
