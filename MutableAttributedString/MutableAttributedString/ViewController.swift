//
//  ViewController.swift
//  MutableAttributedString
//
//  Created by Van Le on 6/15/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myText: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let attrS1 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 28), NSAttributedStringKey.foregroundColor : UIColor.green]
        
        let attrS2 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let attributedString1 = NSMutableAttributedString(string:"1", attributes: attrS1)
        
        let attributedString2 = NSMutableAttributedString(string:"Survey", attributes: attrS2)
        
        attributedString1.append(attributedString2)
        self.myText.attributedText = attributedString1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

