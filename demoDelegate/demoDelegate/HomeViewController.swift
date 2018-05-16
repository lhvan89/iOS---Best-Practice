//
//  ViewController.swift
//  demoDelegate
//
//  Created by ✪ Lê Vấn ✪ on 5/16/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var userName: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeUser(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        userName.setTitle("Select name", for: .normal)
    }
    
}

extension HomeViewController: LoginViewControllerDelegate {
    func getUserName(name: String) {
        userName.setTitle("Welcome \(name)", for: .normal)
    }
}
