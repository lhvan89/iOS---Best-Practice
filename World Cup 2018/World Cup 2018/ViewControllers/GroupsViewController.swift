//
//  ViewController.swift
//  World Cup 2018
//
//  Created by ✪ Lê Vấn ✪ on 5/31/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import Firebase

class GroupsViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
//        ref = Database.database().reference()
//        
//        self.ref.child("Groups").queryOrderedByKey().observe(.value) { (snap) in
//            print(snap)
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
}
