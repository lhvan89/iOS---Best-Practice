//
//  DetailViewController.swift
//  Pokemon-Deeplinks
//
//  Created by lhvan on 5/24/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var data: Pokemon!
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         initScreen()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    func initScreen(){
        
        if UserDefaults.standard.value(forKey: "appLinks") != nil {
            let data = UserDefaults.standard.integer(forKey: "appLinks")
            self.data = ListPokemon[data-1]
            UserDefaults.standard.removeObject(forKey: "appLinks")
        }
        
        guard let url = URL(string: hostImg + data.imageName) else { return }
        print(url)
        detailImage.sd_setImage(with: url, placeholderImage: nil, options: SDWebImageOptions.lowPriority, completed: nil)
//        detailImage.kf.setImage(with: url)

//        detailImage.loadImage(fromURL: hostImg + data.imageName)
        id.text = "\(data.id)"
        name.text = data.name
        type.text = data.type
    }

}
