//
//  Tag.swift
//  Library
//
//  Created by lhvan on 5/6/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import Foundation

struct Tag {
    var name: String
    var isSelected: Bool = false
    init(name: String, isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
    }
    init(name: String) {
        self.name = name
    }
}
