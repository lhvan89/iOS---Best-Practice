//
//  Match.swift
//  World Cup 2018
//
//  Created by lhvan on 6/2/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation
import UIKit

struct Match {
    var date: Date
    var goalsTeamA: Int
    var goalsTeamB: Int
    var group: String
    var tvs: String
    var teamA: String
    var teamB: String
    init(d:String, ga: Int, gb: Int, gr: String, tvs: String, ta: String, tb: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm Z"
        self.date = dateFormatter.date(from: d)!
        self.goalsTeamA = ga
        self.goalsTeamB = gb
        self.group = gr
        self.tvs = tvs
        self.teamA = ta
        self.teamB = tb
    }
}
struct Schedule {
    var date: String
    var matches: [Match]
}

let scheduleAll = [
    Schedule(date: "2018-06-14", matches: [
        Match(d: "2018-06-14 22:00 +0700", ga: 0, gb: 0, gr: "A", tvs: "VTV3 & VTC1", ta: "Russia", tb: "Saudi Arabia")
    ]),
    Schedule(date: "2018-06-15", matches: [
        Match(d: "2018-06-15 19:00 +0700", ga: 0, gb: 0, gr: "A", tvs: "VTV3 & VTC1", ta: "Egypt", tb: "Uruguay"),
        Match(d: "2018-06-15 22:00 +0700", ga: 0, gb: 0, gr: "B", tvs: "VTV3 & VTC1", ta: "Morocco", tb: "IR Iran")
    ]),
    Schedule(date: "2018-06-16", matches: [
        Match(d: "2018-06-16 01:00 +0700", ga: 0, gb: 0, gr: "B", tvs: "VTV3 & VTC1", ta: "Portugal", tb: "Spain")
    ])
]

let scheduleTeam = [
    Schedule(date: "2018-06-14", matches: [
        Match(d: "2018-06-14 22:00 +0700", ga: 0, gb: 0, gr: "A", tvs: "VTV3 & VTC1", ta: "Russia", tb: "Saudi Arabia")
    ]),
    Schedule(date: "2018-06-20", matches: [
        Match(d: "2018-06-20 1:00 +0700", ga: 0, gb: 0, gr: "A", tvs: "VTV3 & VTC1", ta: "Russia", tb: "Egypt")
    ]),
    Schedule(date: "2018-06-25", matches: [
        Match(d: "2018-06-25 21:00 +0700", ga: 0, gb: 0, gr: "A", tvs: "VTV3 & VTC1", ta: "Russia", tb: "Uruguay")
    ])
]












