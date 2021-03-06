//
//  GroupsCollectionViewCell.swift
//  World Cup 2018
//
//  Created by lhvan on 6/1/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import Localize_Swift

class GroupsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var teamName1: UILabel!
    @IBOutlet weak var teamName2: UILabel!
    @IBOutlet weak var teamName3: UILabel!
    @IBOutlet weak var teamName4: UILabel!
    @IBOutlet weak var flagTeam1: UIImageView!
    @IBOutlet weak var flagTeam2: UIImageView!
    @IBOutlet weak var flagTeam3: UIImageView!
    @IBOutlet weak var flagTeam4: UIImageView!
    @IBOutlet weak var bgCell: UIImageView!
    
    func initCell(group: Group){
        
        let groupName = group.groupName
        let teams = group.teams
        
        let teamName1 = teams[0].teamName
        let teamName2 = teams[1].teamName
        let teamName3 = teams[2].teamName
        let teamName4 = teams[3].teamName
        
        self.groupName.text = "GROUP".localized() + " \(groupName)"
        
        self.teamName1.text = teamName1.localized()
        self.teamName2.text = teamName2.localized()
        self.teamName3.text = teamName3.localized()
        self.teamName4.text = teamName4.localized()
        
        self.flagTeam1.image = UIImage(named: teamName1)
        self.flagTeam2.image = UIImage(named: teamName2)
        self.flagTeam3.image = UIImage(named: teamName3)
        self.flagTeam4.image = UIImage(named: teamName4)
        
    }
}
