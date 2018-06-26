//
//  Contributor.swift
//  RequestAPI
//
//  Created by lhvan on 6/25/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import Foundation
import SwiftyJSON

class Contributor {
    
    internal var username: String!
    internal var surveys: Int!
    
    required init(json: JSON) {
        
        self.username = json["username"].stringValue
        self.surveys = json["surveys"].intValue
    }
}
