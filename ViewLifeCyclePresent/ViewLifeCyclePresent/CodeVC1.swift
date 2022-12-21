//
//  ViewController.swift
//  ViewLifeCyclePresent
//
//  Created by 김성호 on 2022/12/15.
//

import UIKit

class CodeVC1: UIViewController {
    
    // MARK: [변수]
    private lazy var label: UILabel = {
        let l = UILabel()
        
        l.text = "Code VC1"
        l.textColor = .white
        l.backgroundColor = .black
        
        return l
    }()
    
    
    private lazy var button: UIButton = {
        let b = UIButton()
        
        b.setTitle("Next CodeVC2 ->", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.backgroundColor = .brown
        b.addTarget(self, action: #selector(tapped(_sender:)), for: .touchUpInside)
        
        return b
    }()
    
    
    
    // MARK: [Override]
    override func loadView() {
        //super.loadView()
        print("Code VC1 loadView")
        
        //view = CustomView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Code VC1 viewDidLoad")
        layout()
    }
    
    override func viewWillAppear(_ aaaa: Bool) {
        super.viewWillAppear(aaaa)
        print("Code VC1 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Code VC1 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Code VC1 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Code VC1 viewDidDisappear")
    }
    
   
    
    
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.label)
        self.view.addSubview(self.button)
        
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            
            
            
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            
        ])
        
    }
    
    
    @objc private func tapped(_sender: UIButton) {
        let vc = CodeVC2()
        
        vc.modalTransitionStyle = .coverVertical
        
        
        
       
        //vc.modalPresentationStyle = .popover
        //vc.modalPresentationStyle = .automatic
        //vc.modalPresentationStyle = .pageSheet
        vc.modalPresentationStyle = .overFullScreen
        
        //vc.modalPresentationStyle = .fullScreen
        
        
        
        
        
        
        
        self.present(vc, animated: true)
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

