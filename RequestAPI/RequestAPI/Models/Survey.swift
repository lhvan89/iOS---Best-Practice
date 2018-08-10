//
//  Survey.swift
//  HushCity
//
//  Created by An Nguyen on 11/2/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class Survey: BaseModel {
    
    internal var data: SurveyData!
    internal var sections: [HCSection]!
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        
        data = SurveyData()
        
        var tempSections = [HCSection]()
        _ = json["survey"].map { (key, value) in
            let section = HCSection(json: value)
            tempSections.append(section)
        }
        if tempSections.count > 1 {
            sections = tempSections.sorted(by: { (s1, s2) -> Bool in
                return s1.id! < s2.id!
            })
        } else {
            sections = tempSections
        }
    }
}
