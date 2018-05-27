//
//  HomeViewController.swift
//  Storyboard References
//
//  Created by lhvan on 5/26/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

//let myTabBar = UITabBarController(nibName: "TabbarVC", bundle: nil)

class HomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let myTabBar = tabBarController
        
        
        
//        print(myTabBar.tabBar.isHidden)
        
    }
    
    @IBAction func toggleTabbar(_ sender: Any) {
        let myTabBar = tabBarController
        myTabBar?.tabBar.isHidden = !(myTabBar?.tabBar.isHidden)!
        
        print("tabbar: \(String(describing: myTabBar?.tabBar.isHidden))")
     
        _ = navigationController
        navigationController?.isNavigationBarHidden = !(navigationController?.isNavigationBarHidden)!
    }
}


