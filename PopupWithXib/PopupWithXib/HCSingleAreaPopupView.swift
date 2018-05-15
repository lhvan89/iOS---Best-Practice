//
//  HCSingleAreaPopupView.swift
//  PopupWithXib
//
//  Created by Van on 5/15/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

protocol HCSingleAreaPopupViewDelegate {
    func singleAreaPopupView(popupView: HCSingleAreaPopupView)
    func singleAreaPopupViewDidClosed()
}

class HCSingleAreaPopupView: UIView {
    
    class func instanceFromNib() -> HCSingleAreaPopupView {
        return UINib(nibName: "HCSingleAreaPopupView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HCSingleAreaPopupView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
