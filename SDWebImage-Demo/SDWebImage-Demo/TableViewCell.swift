//
//  TableViewCell.swift
//  SDWebImage-Demo
//
//  Created by Van on 5/14/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
    let hostImg = "http://www.dbs-cardgame.com/images/cardlist/cardimg/"

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
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
        var name = id < 10 ? "00\(id)" : id < 100 ? "0\(id)" : "\(id)"
        name = "BT3-\(name).png"
        let url = URL(string: "\(hostImg)\(name)")
        label.text = name
        thumbImage.sd_setShowActivityIndicatorView(true)
        thumbImage.sd_setIndicatorStyle(.gray)
        thumbImage.sd_setImage(with: url, completed: nil)
//        thumbImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeholder"), options: SDWebImageOptions.allowInvalidSSLCertificates, completed: nil)
    }
}
