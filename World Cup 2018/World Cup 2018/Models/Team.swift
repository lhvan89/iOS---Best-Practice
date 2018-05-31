//
//  Team.swift
//  World Cup 2018
//
//  Created by ✪ Lê Vấn ✪ on 5/31/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation

struct Team {
    var name:String
    var point:Int = 0
    var rank:Int = 0
    
    init?(data: [String:AnyObject]){
        guard let name = data["name"] as? String else { return nil }
        if let point = data["point"] as? Int {
            self.point = point
        }
        if let rank = data["rank"] as? Int {
            self.rank = rank
        }
        self.name = name
    }
    
    init(name:String, point:Int, rank: Int) {
        self.name   = name
        self.point  = point
        self.rank = rank
    }
    
    init(name: String) {
        self.init(name: name, point: 0, rank: 0)
    }
    
    init(name:String, rank: Int) {
        self.init(name: name, point: 0, rank: rank )
    }
}
