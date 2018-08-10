//
//  ViewController.swift
//  Struct Demo
//
//  Created by Van Le on 7/10/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let myself = Person(firstName: "Le Hong", lastName: "Van")
//        print(myself.fullName)
        
        var temp = Temperature(celsius: 30)
        print(temp.fahrenheit)
        
        temp.fahrenheit = 86
        print(temp.celsius)
    }
}
