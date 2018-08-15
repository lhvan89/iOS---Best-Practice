//
//  TodayAppTableCell.swift
//  Appstore iOS 11
//
//  Created by Van Le on 8/15/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

struct TodayAppTableCellItem {
    var largerTitle: String?
    var title: String?
    var subTitle: String?
    var urlBackground: String?
    var urlIcon: String?
    var price: String?
}

class TodayAppTableCell: UITableViewCell {
    
    // cardView
    private lazy var cardView: Card = {
        let card = Card()
        return card
    }()
    
    // bottomView
    private lazy var bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    // largerTitle
    private lazy var largerTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    var cellItem: TodayAppTableCellItem? {
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
        self.addSubview(self.cardView)
        self.cardView.addSubview(self.largerTitle)
        self.cardView.addSubview(self.bottomView)
        
        // cardView
        self.cardView.snp.makeConstraints { [weak self] (maker) in
            guard let strongSelf = self else { return }
            maker.top.equalTo(strongSelf).offset(15)
            maker.bottom.equalTo(strongSelf).offset(-15)
            maker.left.equalTo(strongSelf).offset(20)
            maker.right.equalTo(strongSelf).offset(-20)
            maker.height.equalTo(strongSelf.cardView.snp.width).multipliedBy(336/412)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setData(){
    }
}
