//
//  SecondViewController.swift
//  NoticeSwift
//
//  Created by Van on 5/9/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pleaseWaite(_ sender: Any) {
        self.pleaseWait()
    }
    
    @IBAction func successNotice(_ sender: Any) {
        self.successNotice("Success", autoClear: true)
    }
    
    @IBAction func errorNotice(_ sender: Any) {
        self.errorNotice("Error", autoClear: true)
    }
    
    @IBAction func infoNotice(_ sender: Any) {
        self.infoNotice("This is info notice", autoClear: true)
    }
    
    @IBAction func noticeOnlyText(_ sender: Any) {
        
        self.noticeOnlyText("SwiftNotice is a GUI library for displaying various popups (HUD) written in pure Swift, fits any scrollview and supports iPhone X.")
    }
    
    @IBAction func noticeTop(_ sender: Any) {
        self.noticeTop("insert successfull", autoClear: true, autoClearTime: 3)
    }
    
    @IBAction func clearAllNotice(_ sender: Any) {
        self.clearAllNotice()
    }
    
    
    
}










