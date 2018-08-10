//
//  HCQuestion.swift
//  HushCity
//
//  Created by An Nguyen on 11/2/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

enum HCQuestionFunctional {
    case normal
    case noiseStatus
    case description
}

class HCQuestion: BaseModel {
    
    internal var type: String!
    internal var options: [String]!
    internal var content: String!
    internal var parentId: Int!
    internal var required: Bool!
    internal var functional: HCQuestionFunctional!
    internal var reply: String!
    internal var parentIndex: Int?
    internal var index: Int!
    internal var answer: Variable<String>!
    
    override init() {
        super.init()
    }
    
    required init(json: JSON) {
        super.init()
        
        self.id = json["id"].intValue
        self.type = json["type"].stringValue
        self.content = json["content"].stringValue
        self.parentId = json["parent_id"].intValue
        self.required = json["required"].intValue == 1 ? true : false
        let functionalValue = json["function"].intValue
        switch functionalValue {
        case 1:
            self.functional = .noiseStatus
        default:
            self.functional = .normal
        }
        self.reply = json["reply"].stringValue
        
        let optionString = json["options"].stringValue
        if optionString.length > 0 {
            self.options = [String]()
            let arrayOptions = optionString.trimmedComponents(separatedBy: "|-|")
            for option in arrayOptions {
                if (!self.options.contains(option)) {
                    self.options.append(option)
                }
            }
        }
        let answerString = json["answer"].stringValue
        if answerString.length > 0 {
            self.answer = Variable(json["answer"].stringValue)
        } else {
            self.answer = Variable("")
        }
    }
}

extension String {
    
    func trimmedComponents(separatedBy string: String) -> [String] {
        
        let components = self.components(separatedBy: string)
        let result = components.map({ string in
            return string.trimmingCharacters(in: CharacterSet.whitespaces)
        })
        return result
    }
    
}
