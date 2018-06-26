//
//  Request.swift
//  RequestAPI
//
//  Created by lhvan on 6/25/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import Foundation
import Alamofire

class Request: NSObject {
    
    // MARK: - Private API
    private var _manager: Alamofire.SessionManager!
    
    
    // MARK: - Public API
    internal var manager: Alamofire.SessionManager! {
        get {
            
            // Self protected
            if _manager == nil {
                _manager = Alamofire.SessionManager()
            }
            
            return _manager
        }
    }
}
