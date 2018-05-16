//
//  ViewController.swift
//  Delegate-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/16/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, getDataDelegate {
    
    @IBOutlet weak var labelData: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getDataFromAnotherVC(dataString : String)
    {
        labelData.text = dataString
    }
    
    @IBAction func goToSecondVC(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        vc.delegate = self
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
