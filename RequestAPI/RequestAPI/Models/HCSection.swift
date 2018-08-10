//
//  HCSection.swift
//  HushCity
//
//  Created by An Nguyen on 11/2/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class HCSection: BaseModel {
    
    internal var questions: [HCQuestion]!
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        
        self.id = json["section_id"].intValue
        self.name = json["section_name"].stringValue
        
        var tempQuestions = [HCQuestion]()
        _ = json["questions"].map { (key, value) in
            let question = HCQuestion(json: value)
            tempQuestions.append(question)
        }
        
        if tempQuestions.count > 1 {
            tempQuestions = tempQuestions.sorted(by: { (q1, q2) -> Bool in
                return q1.id! < q2.id!
            })
        }
        
        let parents = tempQuestions.filter({ question -> Bool in
            return question.parentId == 0
        })
        
        let childs = tempQuestions.filter({ question -> Bool in
            return question.parentId != 0
        })
        
        self.questions = parents
        
        for i in 0...questions.count - 1 {
            self.questions[i].index = i + 1
        }
        
        for parent in parents {
            var currentIndex = 0
            _ = childs.reversed().map({ child in
                if (child.parentId == parent.id) {
                    let index = self.questions.index { q -> Bool in
                        return q.id == parent.id
                    }
                    if let index = index {
                        currentIndex += 1
                        child.index = currentIndex
                        child.parentIndex = parent.index
                        self.questions.insert(child, at: index + 1)
                    }
                }
            })
        }
        print("")
    }
    
}
