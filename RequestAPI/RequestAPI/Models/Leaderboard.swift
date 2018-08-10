//
//  Leaderboard.swift
//  HushCity
//
//  Created by Van Le on 6/14/18.
//  Copyright © 2018 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class Leaderboard: BaseModel {
    
    internal var start_date: String!
    internal var end_date: String!
    internal var contributors: [Contributor]!
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        
        self.start_date = json["start_date"].stringValue
        self.end_date = json["end_date"].stringValue
        self.contributors = [Contributor]()
        _ = json["contributors"].map { (key, value) in
            let contributor = Contributor(json: value)
            self.contributors.append(contributor)
        }
    }
}
