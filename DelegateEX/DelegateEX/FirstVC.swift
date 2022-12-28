//
//  ViewController.swift
//  DelegateEX
//
//  Created by 김성호 on 2022/12/27.
//

import UIKit

class FirstVC: UIViewController, VCProtocol {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func FirstVCAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
        self.present(vc, animated: true)
        
    }
    
    func saveName(name: String) {
        nameLabel.text = name
    }
}

