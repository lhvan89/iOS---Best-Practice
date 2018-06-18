//
//  ViewController.swift
//  Custom Alert
//
//  Created by lhvan on 6/18/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController")
         vc?.modalPresentationStyle = .custom
        vc?.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
    
}

