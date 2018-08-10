//
//  SurveyData.swift
//  HushCity
//
//  Created by An Nguyen on 11/4/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class SurveyData: BaseModel {
    
    internal var order: Int?
    internal var latitude: Double!
    internal var longitude: Double!
    internal var accuracy: Double!
    internal var address: String!
    internal var minNoise: Float!
    internal var maxNoise: Float!
    internal var eqNoise: Float!
    internal var time: Double!
    internal var imageURL: String!
    internal var audioURL: String!
    internal var status: String!
    internal var noiseStatus: String!
    internal var waves: [CGFloat]!
    internal var city: String!
    internal var country: String!

    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.latitude = json["latitude"].doubleValue
        self.longitude = json["longitude"].doubleValue
        self.accuracy = json["accuracy"].doubleValue
        self.address = json["address"].stringValue
        self.minNoise = json[NOISE_MIN].floatValue
        self.maxNoise = json[NOISE_MAX].floatValue
        self.eqNoise = json[NOISE_EQ].floatValue
        self.time = json[TIME].doubleValue
        self.imageURL = json["photo"].stringValue
        self.audioURL = json["audio"].stringValue
        self.status = json["status"].stringValue
        self.noiseStatus = json["noise_status"].stringValue
        self.city = json["city"].stringValue
        self.country = json["country"].stringValue
    }
}
