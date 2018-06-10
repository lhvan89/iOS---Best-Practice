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
    @IBOutlet weak var flagTeamA: UIButton!
    @IBOutlet weak var flagTeamB: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initCell(match: Match){
        groupName.text = "GROUP".localized() + " \(match.group)" //String.showFormatDate(date: match.date)
        tiviShow.text = match.tvs
        teamA.setTitle(match.teamA.localized(), for: .normal)
        teamB.setTitle(match.teamB.localized(), for: .normal)
        time.text = String.showFormatTime(date: match.date)
        goals.text = "\(match.goalsTeamA) - \(match.goalsTeamB)"
        
        flagTeamA.setBackgroundImage(UIImage(named: match.teamA), for: .normal)
        flagTeamB.setBackgroundImage(UIImage(named: match.teamB), for: .normal)
    }
    
    @IBAction func notification(_ sender: Any) {
        buttonNotification.isSelected = !buttonNotification.isSelected
    }
    

}
