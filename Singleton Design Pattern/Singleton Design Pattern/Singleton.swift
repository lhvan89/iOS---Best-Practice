//
//  Singleton.swift
//  Singleton Design Pattern
//
//  Created by lhvan on 6/23/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import Foundation

class Singleton {
    static let instance = Singleton()
    
    var data = 0
    
    private init() {}
    
    func setData(value: Int){
        data = value
    }
    
    func getData() -> Int {
        return data
    }
    
}
