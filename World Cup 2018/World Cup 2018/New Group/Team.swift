//
//  Team.swift
//  World Cup 2018
//
//  Created by lhvan on 6/1/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation

struct Team {
    var teamName: String
    var point: Float
    var rank: Int
    init(teamName: String, point: Float, rank: Int) {
        self.teamName = teamName
        self.point = point
        self.rank = rank
    }
}

