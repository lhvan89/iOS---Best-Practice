//
//  Group.swift
//  World Cup 2018
//
//  Created by lhvan on 6/1/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation

struct Group {
    var groupName: String
    var teams: [Team]
    init(groupName: String, teams: [Team]) {
        self.groupName = groupName
        self.teams = teams
    }
}
