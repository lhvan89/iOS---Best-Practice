//
//  AboutViewController.swift
//  Deep-Link-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/21/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        id.text = "id: \(product.id)"
        name.text = "Name: \(product.name)"
        price.text = "Price: $\(product.price)"
        
    }
}
