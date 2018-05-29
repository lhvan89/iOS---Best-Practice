//
//  BaseMenuController.swift
//  Slide Menu
//
//  Created by ✪ Lê Vấn ✪ on 5/29/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class BaseMenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = 250
    }
}
