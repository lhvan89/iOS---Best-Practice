//
//  Product.swift
//  Deep-Link-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/21/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation

struct Product {
    var id: Int
    var name: String
    var price: Double
    
    init(id: Int, name: String, price: Double) {
        self.id  = id
        self.name = name
        self.price = price
    }
}
