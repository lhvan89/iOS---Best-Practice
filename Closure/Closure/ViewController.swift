//
//  ViewController.swift
//  Closure
//
//  Created by Van Le on 8/6/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData(url: "json") { (data) in
            print(data)
        }
        
    }
    
    func loadData(url: String, completion: (String) -> ()) {
        if url == "json" {
            print("this is json")
        }else {
            print("not json")
        }
    }
}







