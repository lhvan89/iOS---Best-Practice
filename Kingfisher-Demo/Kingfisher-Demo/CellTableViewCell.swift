//
//  CellTableViewCell.swift
//  Kingfisher-Demo
//
//  Created by lhvan on 5/12/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit
import Kingfisher

class CellTableViewCell: UITableViewCell {
    
    let hostImg = "http://www.dbs-cardgame.com/images/cardlist/cardimg/"
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(id: Int){
        
        let id = id + 1
        var imgName = id < 10 ? "00\(id)" : id < 100 ? "0\(id)" : "\(id)"
        imgName = "\(hostImg)/BT3-\(imgName).png"
        
        let url = URL(string: imgName)!
        myImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
    }
}
