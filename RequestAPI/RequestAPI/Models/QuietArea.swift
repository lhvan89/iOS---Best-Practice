//
//  QuietArea.swift
//  HushCity
//
//  Created by Huy Nguyễn on 11/8/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class QuietArea: BaseModel {
    
    internal var imageArea: String!
    internal var latitude: Double!
    internal var longitude: Double!
    internal var distance: String!
    internal var eqNoise: Float!
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        
        self.name = json["name"].stringValue
        self.desc = json["description"].stringValue
        self.imageArea = json["img"].stringValue
        self.latitude = json["latitude"].doubleValue
        self.longitude = json["longitude"].doubleValue
        self.distance = json["distance"].stringValue
        self.eqNoise = json["noise_eq"].floatValue
    }
}
