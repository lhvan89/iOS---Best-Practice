//
//  CustomAlertViewController.swift
//  Custom Alert
//
//  Created by lhvan on 6/18/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closeAlert(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
