//
//  MatchesTableViewCell.swift
//  World Cup 2018
//
//  Created by lhvan on 6/3/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var tiviShow: UILabel!
    @IBOutlet weak var buttonNotification: UIButton!
    @IBOutlet weak var teamA: UIButton!
    @IBOutlet weak var teamB: UIButton!
    @IBOutlet weak var goals: UILabel!
    @IBOutlet weak var time: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(match: Match){
        groupName.text = "Group \(match.group)" //String.showFormatDate(date: match.date)
        tiviShow.text = match.tvs
        teamA.setTitle(match.teamA, for: .normal)
        teamB.setTitle(match.teamB, for: .normal)
        goals.text = "\(match.goalsTeamA) : \(match.goalsTeamB)"
        time.text = String.showFormatTime(date: match.date)
    }

}
