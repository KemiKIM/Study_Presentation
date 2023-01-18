//
//  ViewController.swift
//  AlertController
//
//  Created by 김성호 on 2023/01/10.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    
    @IBAction func redBtnTapped(_ sender: UIButton) {
        // .alert
        
        
        // (1)
        let alert = UIAlertController(title: "Alert Controller", message: "사용하기", preferredStyle: .alert)
        //let alert = UIAlertController(title: <#T##String?#>, message: <#T##String?#>, preferredStyle: UIAlertController.Style.)
       
       
        // (2)
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
     
        
        // (3)
        alert.addAction(cancel)
        alert.addAction(ok)
        
       
        
        
        // (4)
        present(alert, animated: true)
        
        
    }
    
    
    @IBAction func orangeBtnTapped(_ sender: UIButton) {
        actionsheetDefaultAlert(title: "제목: actionsheet", message: "메세지: Default")
    }
    
    
    @IBAction func blueBtnTapped(_ sender: UIButton) {
        actionsheetCancelAlert(title: "제목: actionsheet", message: "메세지: cancel")
    }
    

    
    
}







extension ViewController {
    // .alert
    func alertAlert(title: String, message: String) {
        // (1)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
       
        // (2)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        
        // (3)
        alert.addAction(cancel)
        alert.addAction(ok)
        
        
        // (4)
        present(alert, animated: true)
        
    }
    
    // .actionsheet / default
    func actionsheetDefaultAlert(title: String, message: String) {
        // (1)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
       
        // (2)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("Event")
        })
        
        
        
        //let ok1 = UIAlertAction(title: "", style: .)
        
        
        
        // (3)
        alert.addAction(cancel)
        alert.addAction(ok)
        
        
        // (4)
        present(alert, animated: true)
        
    }
    
    
    // .actionsheet / cancel
    func actionsheetCancelAlert(title: String, message: String) {
        
        // (1)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        
       
        // (2)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        let ok1 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        let ok2 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        
        let ok3 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        let ok4 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        let ok5 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        let ok6 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        let ok7 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        let ok8 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        let ok9 = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("ok")
        })
        
        
        
        
        // (3)
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(ok1)
        alert.addAction(ok2)
        alert.addAction(ok3)
        alert.addAction(ok4)
        alert.addAction(ok5)
        alert.addAction(ok6)
        alert.addAction(ok7)
        alert.addAction(ok8)
        alert.addAction(ok9)
        

        
        
        
        // (4)
        present(alert, animated: true)
         
        
        
        
        
    }
    
        
}

