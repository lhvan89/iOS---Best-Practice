//
//  Leaderboard.swift
//  RequestAPI
//
//  Created by lhvan on 6/25/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import Foundation
import SwiftyJSON

class Leaderboard {
    
    internal var start_date: String!
    internal var end_date: String!
    internal var contributors: [Contributor]!
    
    required init(json: JSON) {
        
        self.start_date = json["start_date"].stringValue
        self.end_date = json["end_date"].stringValue
        self.contributors = [Contributor]()
        _ = json["contributors"].map { (key, value) in
            let contributor = Contributor(json: value)
            self.contributors.append(contributor)
        }
    }
}
