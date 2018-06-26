//
//  SurveyRequest.swift
//  RequestAPI
//
//  Created by lhvan on 6/25/18.
//  Copyright © 2018 lhvan89. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol SurveyRequestDelegate {
    func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyGetLeaderboard data: Leaderboard?, status: Int)
}

class SurveyRequest: Request {
    internal func getLeaderboard(){
        self.manager.request(SurveyRouter.getLeaderboard())
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let leaderboard = Leaderboard(json: data)
                        
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetLeaderboard: leaderboard, status: errCode)
                        
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.getLeaderboard()
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetLeaderboard: nil, status: errCode)
                        })
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
}


enum SurveyRouter: URLRequestConvertible {
    case getLeaderboard()
    
    var method: HTTPMethod {
        switch self {
        case .getLeaderboard:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getLeaderboard:
            return "contributors"
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try MAIN_URL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getLeaderboard():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        }
        
        return urlRequest
    }
}
