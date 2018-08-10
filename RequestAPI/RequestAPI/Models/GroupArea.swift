//
//  GroupArea.swift
//  HushCity
//
//  Created by An Nguyen on 1/3/17.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class GroupArea: BaseModel {
    
    internal var address: String!
    internal var areas: [SurveyData]!
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        
        self.address = json["address"].stringValue
        self.areas = [SurveyData]()
        _ = json["areas"].map { (key, value) in
            let area = SurveyData(json: value)
            self.areas.append(area)
        }
    }
}
