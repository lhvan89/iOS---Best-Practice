//
//  ShareViewController.swift
//  Try Swift
//
//  Created by lhvan on 5/4/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnShare(_ sender: Any) {
        let vc = UIActivityViewController(activityItems: ["Share"], applicationActivities: nil)
        self.present(vc, animated: true, completion: nil)
    }
    

}
