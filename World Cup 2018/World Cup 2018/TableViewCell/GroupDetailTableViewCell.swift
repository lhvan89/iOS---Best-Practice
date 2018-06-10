
//
//  GroupDetailTableViewCell.swift
//  World Cup 2018
//
//  Created by lhvan on 6/10/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class GroupDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var Played: UILabel!
    @IBOutlet weak var Won: UILabel!
    @IBOutlet weak var Draw: UILabel!
    @IBOutlet weak var Lost: UILabel!
    @IBOutlet weak var goalDifference: UILabel!
    @IBOutlet weak var Points: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(team: Team, rank: Int){
        flag.image = UIImage(named: team.teamName)
        teamName.text = "\(rank). \(team.teamName.localized())"
        Played.text = "0"
        Won.text = "0"
        Draw.text = "0"
        Lost.text = "0"
        goalDifference.text = "0-0"
        Points.text = "0"
    }

}
