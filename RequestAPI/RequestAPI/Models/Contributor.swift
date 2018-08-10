//
//  Contributor.swift
//  HushCity
//
//  Created by Van Le on 6/14/18.
//  Copyright © 2018 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class Contributor: BaseModel {
    internal var username: String!
    internal var surveys: Int!
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        
        self.username = json["username"].stringValue
        self.surveys = json["surveys"].intValue
    }
}
