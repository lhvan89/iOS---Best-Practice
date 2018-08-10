//
//  HomeViewController.swift
//  DemoCard
//
//  Created by Van Le on 8/10/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit
import SnapKit
import Cards

class HomeViewController: UIViewController {

    lazy var myview: Card = {
        let view = Card()
        view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        initializeUI()
    }
    
    func initializeUI() {

        self.view.addSubview(self.myview)
        
        self.myview.snp.makeConstraints { [weak self] (maker) in
            guard let strongSelf = self else { return }
            maker.width.height.equalTo(100)
            maker.center.equalTo(strongSelf.view.snp.center)
        }
        myview.shouldPresent(DetailViewController(), from: self, fullscreen: true)
    }
}
