//
//  Match.swift
//  World Cup 2018
//
//  Created by ✪ Lê Vấn ✪ on 5/31/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation

struct Match {
    var date:NSDate
    var goalsTeamA:Int = 0
    var goalsTeamB:Int = 0
    var groups:String
    var tvs:String
    var teamA:String
    var teamB:String
    
    init?(data: [String:AnyObject]) {
        guard let teamA = data["Team 1"] as? String else { return nil }
        guard let teamB = data["Team 2"] as? String else { return nil }
        guard let groups = data["Groups"] as? String else { return nil }
        guard let dateStr = data["Date"] as? String else { return nil }
        guard let tvs = data["TVs"] as? String else { return nil }
        
        self.teamA = teamA
        self.teamB = teamB
        self.groups = groups
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        self.date = dateFormatter.date(from: dateStr)! as NSDate
        self.tvs = tvs
        
        if let goalsTeamA = data["Goals Team 1"] as? Int {
            self.goalsTeamA = goalsTeamA
        }
        
        if let goalsTeamB = data["Goals Team 2"] as? Int {
            self.goalsTeamB = goalsTeamB
        }
        //        guard let goalsTeamA = data["Goals Team 1"] as? String else { return nil }
        //        guard let goalsTeamB = data["Goals Team 2"] as? String else { return nil }
    }
    
    
}
