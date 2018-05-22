//
//  Product.swift
//  Deep-Link-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/21/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation
import UIKit

struct Product {
    var id: Int!
    var name: String!
    var price: Double!
    var image: UIImage!
    
    init(id: Int, name: String, price: Double, urlImage: String) {
        self.id  = id
        self.name = name
        self.price = price
        
        guard let url = URL(string: urlImage) else {return}
        guard let data = try? Data(contentsOf: url) else {return}
        self.image  = UIImage(data: data)!
    }
}
