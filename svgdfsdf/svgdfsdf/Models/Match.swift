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
    var goalsTeamA: Int
    var goalsTeamB: Int
    var group: String
    var tvs: String
    var teamA: String
    var teamB: String
}

//let matches = [
//    Day(day: "14/06/2018", matches: [
//        Match(goalsTeamA: <#T##Int#>, goalsTeamB: <#T##Int#>, group: <#T##String#>, tvs: <#T##String#>, teamA: <#T##String#>, teamB: <#T##String#>)
//    ])
//]

