//
//  DetailViewController.swift
//  DeepLinks
//
//  Created by lhvan on 5/24/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.value(forKey: "appLinks") != nil {
            let data = UserDefaults.standard.integer(forKey: "appLinks")
            label.text = "\(data)"
        }
    }
}
