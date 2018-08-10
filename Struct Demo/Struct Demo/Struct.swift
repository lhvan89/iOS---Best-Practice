//
//  Struct.swift
//  Struct Demo
//
//  Created by Van Le on 7/10/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import Foundation

struct Person {
    
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

struct Temperature {
    var celsius: Double
    var fahrenheit: Double {
        get {
            return celsius * 9 / 5 + 32
        }
        
        set {
            celsius = (newValue - 32) * 5 / 9
        }
    }
}
