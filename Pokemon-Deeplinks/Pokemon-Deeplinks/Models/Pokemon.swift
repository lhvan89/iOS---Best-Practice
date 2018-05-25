//
//  Pokemon.swift
//  Pokemon-Deeplinks
//
//  Created by lhvan on 5/24/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import Foundation

struct Pokemon {
    var id: Int
    var name: String
    var type: String
    var imageName: String
    init(id: Int, name: String, type: String, imageName: String) {
        self.id = id
        self.name = name
        self.type = type
        self.imageName = imageName
    }
}
