//
//  LastRank.swift
//  HushCity
//
//  Created by Van Le on 6/19/18.
//  Copyright © 2018 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class LastRank: BaseModel {
    
    internal var rank: Int!
    internal var startDay: String!
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        self.rank = json["rank"].intValue
        self.startDay = json["start_date"].stringValue
    }
}
