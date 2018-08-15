//
//  TodayHeaderTableCell.swift
//  DemoCard
//
//  Created by Van Le on 8/14/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

struct TodayHeaderTableCellItem {
    var title: String?
    var subTitle: String?
    var urlImage: String?
}

class TodayHeaderTableCell: UITableViewCell {

    // titleLabel
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    // subTitleLabel
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.alpha = 0.5
        return label
    }()
    
    // profileImage
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 17.5
        return image
    }()
    
    var cellItem: TodayHeaderTableCellItem? {
        didSet {
            self.setData()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Initialize UI
    func initializeUI() {
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.subTitleLabel)
        self.addSubview(self.profileImage)
        
        // subTitleLabel
        self.subTitleLabel.snp.makeConstraints { [weak self] (maker) in
            guard let strongSelf = self else { return }
            maker.top.equalTo(strongSelf).offset(8)
            maker.left.equalTo(strongSelf).offset(16)
        }
        
        // titleLabel
        self.titleLabel.snp.makeConstraints { [weak self] (maker) in
            guard let strongSelf = self else { return }
            maker.top.equalTo(strongSelf.subTitleLabel.snp.bottom)
            maker.left.equalTo(strongSelf).offset(16)
            maker.bottom.equalTo(strongSelf).offset(-8)
        }
        
        // profileImage
        self.profileImage.snp.makeConstraints { [weak self] (maker) in
            guard let strongSelf = self else { return }
            maker.width.height.equalTo(35)
            maker.right.equalTo(strongSelf).offset(-16)
            maker.centerY.equalTo(strongSelf.titleLabel.snp.centerY)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = nil
        self.subTitleLabel.text = nil
        self.profileImage.image = nil
    }
    
    func setData(){
        self.titleLabel.text = cellItem?.title
        self.subTitleLabel.text = cellItem?.subTitle
        self.profileImage.image = #imageLiteral(resourceName: "icon_profile")
    }
}
