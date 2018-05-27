//
//  Product.swift
//  URI DeepLinks
//
//  Created by lhvan on 5/27/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import Foundation

class Product {
    var id: String
    var name: String
    var price: Double
    
    var priceString: String {
        return "$ \(price)"
    }
    
    init(id: String, name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }
}
