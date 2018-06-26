//
//  LeaderboardTableViewCell.swift
//  RequestAPI
//
//  Created by lhvan on 6/25/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var surveysTextLabel: UILabel!
    @IBOutlet weak var surveysLabel: UILabel!
    
    @IBOutlet weak var rankButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func handleData(contributor: Contributor, rank: Int){
        
        rankButton.setTitle(nil, for: .normal)
        rankButton.setBackgroundImage(nil, for: .normal)
        
        if rank == 1 {
            rankButton.setBackgroundImage(#imageLiteral(resourceName: "icon-cup-1"), for: .normal)
        }else if rank == 2 {
            rankButton.setBackgroundImage(#imageLiteral(resourceName: "icon-cup-2"), for: .normal)
        }else if rank == 3 {
            rankButton.setBackgroundImage(#imageLiteral(resourceName: "icon-cup-3"), for: .normal)
        }else {
            rankButton.setTitle("\(rank)", for: .normal)
        }
        
        usernameLabel.text = contributor.username
        
        guard let surveys = contributor.surveys else { return }
        surveysTextLabel.text = "Surveys"
        surveysLabel.text = "\(surveys)"
        if rank == 1 {
            surveysLabel.textColor = #colorLiteral(red: 0.9921568627, green: 0.7568627451, blue: 0.1647058824, alpha: 1)
        }else if rank == 2 {
            surveysLabel.textColor = #colorLiteral(red: 0.7294117647, green: 0.7137254902, blue: 0.7333333333, alpha: 1)
        }else if rank == 3 {
            surveysLabel.textColor = #colorLiteral(red: 0.8470588235, green: 0.6862745098, blue: 0.4274509804, alpha: 1)
        }else {
            surveysLabel.textColor = #colorLiteral(red: 0.1215686275, green: 0.1254901961, blue: 0.1568627451, alpha: 1)
        }
    }

}
