//
//  ViewController1.swift
//  NotificationEX
//
//  Created by 김성호 on 2023/01/17.
//

import UIKit

class ViewController1: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector: #selector(notiTapped), name: ViewController2.noti, object: nil)
        print("VC 1 - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(notiTapped), name: ViewController2.noti, object: nil)
        
        
        print("VC 1 - viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // removeObserver
        
        
        print("VC 1 - viewDidDisappear")
    }
    
    
    
    @objc
    func notiTapped() {
        print("notiTapped")
        self.view.backgroundColor = .systemYellow
    }
    
    
    

    @IBAction func tapped1(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 else { return }
        
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
        
        
    }


}
