//
//  PokemonCellTableViewCell.swift
//  Pokemon-Deeplinks
//
//  Created by lhvan on 5/25/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
//    var id:Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initCell(imgName: String, name:String){
        guard let url = URL(string: hostImg + imgName) else { return }
//        print(url)
        thumbImage.sd_setImage(with: url, placeholderImage: nil, options: SDWebImageOptions.cacheMemoryOnly, completed: nil)
//        thumbImage.kf.setImage(with: url)
        nameLabel.text = name
    }

}













