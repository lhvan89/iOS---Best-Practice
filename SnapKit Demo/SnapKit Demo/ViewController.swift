//
//  ViewController.swift
//  SnapKit Demo
//
//  Created by Van Le on 7/9/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let box = UIView()
        box.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(box)
        
        box.snp.makeConstraints { (make) in
//            make.top.equalTo(self.view).offset(20)
//            make.left.equalTo(self.view).offset(20)
//            make.bottom.equalTo(self.view).offset(-20)
//            make.right.equalTo(self.view).offset(-20)
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(20, 20, 20, 20))
        }
    }
}



























