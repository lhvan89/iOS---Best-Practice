//
//  ProductCellTableViewCell.swift
//  Deep-Link-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/22/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(product: Product){
        thumbImage.image = product.image
        nameLabel.text = product.name
        priceLabel.text = "$ \(product.price!)"
    }

}
