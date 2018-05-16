//
//  DetailViewController.swift
//  Delegate-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/16/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

protocol  getDataDelegate  {
    func getDataFromAnotherVC(dataString: String)
}

class SecondViewController: UIViewController {
    
    var delegate : getDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backToFirstVC(_ sender: UIButton) {
        self.delegate?.getDataFromAnotherVC(dataString: "data from second view controller")
        self.navigationController?.popViewController(animated: true)
    }
    
}
