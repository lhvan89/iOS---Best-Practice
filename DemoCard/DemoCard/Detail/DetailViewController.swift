//
//  DetailViewController.swift
//  DemoCard
//
//  Created by Van Le on 8/10/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var detailview: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        initializeUI()
    }
    
    func initializeUI() {
        
        self.view.addSubview(detailview)
        
        self.detailview.snp.makeConstraints { [weak self] (maker) in
            guard let strongSelf = self else { return }
            maker.width.height.equalTo(300)
            maker.center.equalTo(strongSelf.view.snp.center)
        }
        
//        let cardContent = storyboard!.instantiateViewController(withIdentifier: "CardContent")
        
//        de.shouldPresent(cardContent, from: self, fullscreen: true)
        
    }
}
