//
//  LoginViewController.swift
//  demoDelegate
//
//  Created by ✪ Lê Vấn ✪ on 5/16/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate {
    func getUserName(name: String)
}

class LoginViewController: UIViewController {
    
    var arrButton: [UIButton] = [UIButton]()
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeUser(_ sender: UIButton) {
        
        guard let userName = sender.titleLabel?.text else { return }
        self.delegate?.getUserName(name: userName)
        
        navigationController?.popViewController(animated: true)
        
    }
}
