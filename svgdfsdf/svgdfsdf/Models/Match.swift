//
//  Match.swift
//  svgdfsdf
//
//  Created by ✪ Lê Vấn ✪ on 6/1/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import Foundation
import UIKit

struct Day {
    var day: String
    var matches: [Match]
}
struct Match {
    var goalsTeam1: Int
    var goalsTeam2: Int
    var group: String
    var tvs: String
    var team1: String
    var team2: String
}

let matches = [
    Day(day: "14/06/2018", matches: <#T##[Match]#>)
]

