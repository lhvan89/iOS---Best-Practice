//
//  ViewController.swift
//  PopupWithXib
//
//  Created by Van on 5/15/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showDetailPopup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func showDetailPopup() {
        
        let popup = HCSingleAreaPopupView.instanceFromNib()

        popup.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

//        popup.delegate = self
//        popup.handleData(data: group.areas[0])
        view.addSubview(popup)
        view.bringSubview(toFront: popup)
//        mapView.padding = UIEdgeInsetsMake(0, 0, height - 50, 0)
        
//        if group.areas.count == 1 {
//
//        } else {
//            let popup = HCMultipleAreaPopupView.instanceFromNib()
//            let height = 273 * SCREEN_WIDTH_RATIO
//            popup.frame = CGRect(x: 0, y: SCREEN_HEIGHT - height - 44, width: SCREEN_WIDTH, height: height)
//            popup.delegate = self
//            popup.handleData(data: group.areas)
//            view.addSubview(popup)
//            view.bringSubview(toFront: popup)
//            mapView.padding = UIEdgeInsetsMake(0, 0, height - 50, 0)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.popupShowed = true
//        }
    }


}

