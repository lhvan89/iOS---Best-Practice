//
//  ViewController.swift
//  SwiftyJSON-Demo
//
//  Created by Van on 5/14/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://api.github.com/search/users?q=lhvan89") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        
        guard let result = try? JSON(data: data).dictionaryValue else { return }
        
        guard let items = result["items"]?.arrayValue else { return }
        let name = items[0]["login"].stringValue
        
        print(name)
    }
}
