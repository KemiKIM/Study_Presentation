//
//  CodeVC2.swift
//  ViewLifeCyclePresent
//
//  Created by 김성호 on 2022/12/20.
//

import UIKit

class CodeVC2: UIViewController {
    
    // MARK: [변수]
    private lazy var label: UILabel = {
        let l = UILabel()
        
        l.text = "Code VC2"
        
        return l
    }()
    
    
    private lazy var button: UIButton = {
        let b = UIButton()
        
        b.setTitle("<- Next CodeVC1", for: .normal)
        b.setTitleColor(UIColor.black, for: .normal)
        b.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        return b
    }()
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("== Code VC2 viewDidLoad")
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("== Code VC2 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("== Code VC2 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("== Code VC2 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("== Code VC2 viewDidDisappear")
    }
    
    
    deinit {
        print("== Code VC2 deinit")
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
    
    
    @objc private func tapped() {
        self.dismiss(animated: true)
        //self.navigationController?.popViewController(animated: true)
    }
    

}

