//
//  AlamoWater.swift
//  AlamoWater
//
//  Created by Van Le on 8/15/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

public protocol AlamoWaterProtocol {
    func didCallHello()
}

open class AlamoWater: NSObject {
    public static let shared = AlamoWater()
    
    public var delegate:AlamoWaterProtocol?
    
    open func hello(){
        debugPrint("Hello from AlamoWater!")
        AlamoWater.shared.delegate?.didCallHello()
    }
}
