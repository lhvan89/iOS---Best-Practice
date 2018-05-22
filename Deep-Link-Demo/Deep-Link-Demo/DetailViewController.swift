//
//  AboutViewController.swift
//  Deep-Link-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/21/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productId: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let id = product.id, let name = product.name, let price = product.price, let image = product.image else {return}

        productImage.image = image
        productId.text = "\(id)"
        productName.text = "\(name)"
        productPrice.text = "$\(price)"

    }
}
