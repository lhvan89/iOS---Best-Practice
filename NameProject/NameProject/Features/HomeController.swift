//
//  ViewController.swift
//  NameProject
//
//  Created by lhvan on 7/21/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    let myView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

