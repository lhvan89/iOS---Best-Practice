//
//  RatingModel.swift
//  HushCity
//
//  Created by Giap Vo Duc on 11/2/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import RxSwift

struct smileModelRating {
    
    var smileName: Variable<String>!
    var isSelectedSmile: Variable<Bool> = Variable(false)
    
    init(smileName: String, isSelectedSmile: Bool = false) {
        self.smileName = Variable(smileName)
        self.isSelectedSmile = Variable(isSelectedSmile)
    }
}
