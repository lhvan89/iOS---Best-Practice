//
//  TeamCollectionViewCell.swift
//  World Cup 2018
//
//  Created by lhvan on 6/11/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgTeam: UIImageView!
    @IBOutlet weak var bannerTeam: UIImageView!
    @IBOutlet weak var flagTeam: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    func initCell(teamName: String) {
        bgTeam.image = UIImage(named: "bg-\(teamName)")
        bannerTeam.image = UIImage(named: "Banner-\(teamName)")
        flagTeam.image = UIImage(named: teamName)
        self.teamName.text = teamName.localized()
    }
}
