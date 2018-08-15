//
//  UIImageView+LoadImage.swift
//  Appstore iOS 11
//
//  Created by Van Le on 8/15/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(urlString: String?, placeholder: UIImage?){
        guard let urlString = urlString else { return }
        let url = URL(string: urlString)
        self.kf.setImage(with: url, placeholder: placeholder)
    }
}
