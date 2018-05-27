//
//  LoginViewController.swift
//  Storyboard References
//
//  Created by lhvan on 5/26/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
//    let myTabBar = tabbarcon

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTabBar = tabBarController
        
        print(myTabBar?.tabBar.isHidden)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
