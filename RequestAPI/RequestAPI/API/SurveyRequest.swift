//
//  SurveyRequest.swift
//  HushCity
//
//  Created by An Nguyen on 11/2/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

@objc protocol SurveyRequestDelegate: RequestDelegate {
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyGetGroupAreas data: [GroupArea]?, status: Int)
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyGetQuietAreas data: [SurveyData]?, status: Int)
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyGetRecentSurveys surveys: [SurveyData], total: Int)
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyGetSurveyDetails survey: Survey)
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyGetSurvey survey: Survey)
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullySubmitData dataId: Int)
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullySubmitSurvey dataId: Int)
    
    @objc optional func didSuccessfullyUploadFiles()
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didUploadFilesWithProgress progress: Double)
    
    @objc optional func didSuccessfullyRequestDeleteSurveys()
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyFilterGroupAreas data: [GroupArea]?, status: Int)
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyGetLeaderboard data: Leaderboard?, status: Int)
    
    @objc optional func surveyRequest(surveyRequest: SurveyRequest, didSuccessfullyGetLastRank data: LastRank?, status: Int)
}

class SurveyRequest: Request {
    
    internal func renewToken(success: @escaping () -> (), failure: @escaping () -> ()) {
        
        self.parameters = [REFRESH_TOKEN: User.REFRESH_TOKEN as AnyObject]
        
        self.manager.request(SurveyRouter.renewToken(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        User.AUTHENTICATION_TOKEN = response[RESPONSE_DATA][ACCESS_TOKEN].stringValue
                        print("New User.AUTHENTICATION_TOKEN: \(User.AUTHENTICATION_TOKEN)")
                        success()
                    } else {
                        failure()
                    }
                case .failure(let error):
                    print(error)
                    failure()
                    break
                }
        }
    }
    
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
    
    internal func getGroupAreas(latitude: Double, longitude: Double) {
        
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject, LATITUDE: latitude as AnyObject, LONGITUDE: longitude as AnyObject]
        self.manager.request(SurveyRouter.getGroupAreas(parameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    //                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let surveyData = data["survey"]
                        var groupAreas = [GroupArea]()
                        _ = surveyData.map { (string, value) in
                            let group = GroupArea(json: value)
                            groupAreas.append(group)
                        }
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetGroupAreas: groupAreas, status: errCode)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.getGroupAreas(latitude: latitude, longitude: longitude)
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetGroupAreas: nil, status: errCode)
                        })
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    internal func getQuietAreas(latitude: Double, longitude: Double) {
        
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject, LATITUDE: latitude as AnyObject, LONGITUDE: longitude as AnyObject]
        self.manager.request(SurveyRouter.getQuietAreas(parameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    //                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let surveyData = data["survey"]
                        var quietAreas = [SurveyData]()
                        _ = surveyData.map { (string, value) in
                            let area = SurveyData(json: value)
                            quietAreas.append(area)
                        }
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetQuietAreas: quietAreas, status: errCode)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.getQuietAreas(latitude: latitude, longitude: longitude)
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetQuietAreas: nil, status: errCode)
                        })
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    internal func getRecentSurveys(page: Int, limit: Int) {
        
        let uuid = UIDevice.current.identifierForVendor?.uuidString as AnyObject? // UUID().uuidString
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject, DEVICE_UUID: uuid as AnyObject, RECENT_PAGE: page as AnyObject, RECENT_LIMIT: limit as AnyObject]
        
        self.manager.request(SurveyRouter.getRecentSurvey(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    //                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let surveyData = data["survey"]
                        var surveys = [SurveyData]()
                        _ = surveyData.map { (string, value) in
                            let survey = SurveyData(json: value)
                            surveys.append(survey)
                        }
                        let total = data["total"].intValue
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetRecentSurveys: surveys, total: total)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.getRecentSurveys(page: page, limit: limit)
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                        })
                    } else {
                        (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                }
        }
    }
    
    internal func getQuestionDetails(dataId: Int) {
        
        self.parameters = [DATA_ID: dataId as AnyObject]
        
        self.manager.request(SurveyRouter.getQuestionDetails(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    //                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let survey = Survey(json: data)
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetSurveyDetails: survey)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.getQuestionDetails(dataId: dataId)
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                        })
                    } else {
                        (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                }
        }
    }
    
    internal func getSurvey() {
        
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject]
        
        self.manager.request(SurveyRouter.getSurvey(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    //                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let survey = Survey(json: data)
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetSurvey: survey)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.getSurvey()
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                        })
                    } else {
                        (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                }
        }
    }
    
    internal func submitData(surveyData: SurveyData) {
        
        var data = [String:AnyObject]()
        data[LATITUDE] = surveyData.latitude as AnyObject?
        data[LONGITUDE] = surveyData.longitude as AnyObject?
        data[ACCURACY] = surveyData.accuracy as AnyObject?
        data[ADDRESS] = surveyData.address as AnyObject?
        data["city"] = surveyData.city as AnyObject?
        data["country"] = surveyData.country as AnyObject?
        data[NOISE_MIN] = surveyData.minNoise as AnyObject?
        data[NOISE_MAX] = surveyData.maxNoise as AnyObject?
        data[NOISE_EQ] = surveyData.eqNoise as AnyObject?
        data[NOISE_STATUS] = surveyData.noiseStatus as AnyObject?
        data[TIME] = Date().timeIntervalSince1970 as AnyObject?
        
        var device = [String:AnyObject]()
        let currentDevice = UIDevice.current
        device[DEVICE_UUID] = currentDevice.identifierForVendor?.uuidString as AnyObject? // UUID().uuidString
        device[DEVICE_MODEL] = currentDevice.modelName as AnyObject?
        
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject, REQUEST_DATA: data as AnyObject, DEVICE: device as AnyObject]
        
        self.manager.request(SurveyRouter.submitData(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let dataId = response[RESPONSE_DATA][DATA_ID].intValue
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullySubmitData: dataId)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.submitData(surveyData: surveyData)
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                        })
                    } else {
                        (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                }
        }
    }
    
    internal func submitSurvey(dataId: Int, sections: [HCSection]) {
        
        let questions = NSMutableArray()
        for section in sections {
            for question in section.questions {
                var qst = [String:AnyObject]()
                qst[QUESTION_ID] = question.id as AnyObject?
                qst[QUESTION_CONTENT] = question.content as AnyObject?
                qst[QUESTION_ANSWER] = question.answer.value as AnyObject?
                qst[QUESTION_SECTION_ID] = section.id as AnyObject?
                qst[QUESTION_PARENT_ID] = question.parentId as AnyObject?
                questions.add(qst)
            }
        }
        
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject, DATA_ID: dataId as AnyObject, QUESTIONS: questions]
        
        self.manager.request(SurveyRouter.submitSurvey(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullySubmitSurvey: dataId)
                    } else {
                        (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                }
        }
    }
    
    internal func uploadFile(dataId: Int, imageURL: String, audioURL: String) {
        
        //        self.parameters = [DATA_ID: dataId as AnyObject]
        
        self.manager.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append("\(dataId)".data(using: .utf8)!, withName: DATA_ID)
            multipartFormData.append(URL(fileURLWithPath: imageURL), withName: IMAGES_NAME, fileName: IMAGE_FILE_NAME, mimeType: IMAGE_MIME)
            multipartFormData.append(URL(fileURLWithPath: audioURL), withName: AUDIOS_NAME, fileName: AUDIO_FILE_NAME, mimeType: AUDIO_MIME)
            
        }, with: SurveyRouter.uploadFile(parameters: self.parameters!), encodingCompletion: { encodingResult in
            
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    guard let value = response.result.value else {
                        (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                        return
                    }
                    let result = JSON(json: value)
                    let errCode = result[ERRORCODE].intValue
                    if errCode == 0 {
                        (self.delegate as! SurveyRequestDelegate).didSuccessfullyUploadFiles!()
                    } else {
                        (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                    }
                }
                upload.uploadProgress(closure: { progress in
                    print(progress.fractionCompleted)
                    (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didUploadFilesWithProgress: progress.fractionCompleted)
                })
            case .failure(let encodingError):
                print(encodingError)
                (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
            }
        })
    }
    
    internal func requestDeleteSurveys(surveys: [SurveyData], email: String) {
        
        var data = [String]()
        for survey in surveys {
            if let id = survey.id {
                data.append("\(id)")
            }
        }
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject, REQUEST_DATA: data as AnyObject, "email": email as AnyObject]
        
        self.manager.request(SurveyRouter.requestDeletion(parameters: self.parameters!))
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        (self.delegate as! SurveyRequestDelegate).didSuccessfullyRequestDeleteSurveys!()
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.requestDeleteSurveys(surveys: surveys, email: email)
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                        })
                    } else {
                        (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: "error")
                }
        }
    }
    
    internal func filterGroupAreas(noise: Int, descriptors: String, quietness: String, visual_quality: String, accessibility: String) {
        self.parameters = ["noise": noise as AnyObject, "descriptors": descriptors as AnyObject, "quietness": quietness as AnyObject, "visual_quality": visual_quality as AnyObject, "accessibility": accessibility as AnyObject]
        self.manager.request(SurveyRouter.filterGroupAreas(parameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    //                    print(value)
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let surveyData = data["survey"]
                        var groupAreas = [GroupArea]()
                        _ = surveyData.map { (string, value) in
                            let group = GroupArea(json: value)
                            groupAreas.append(group)
                        }
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetGroupAreas: groupAreas, status: errCode)
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.filterGroupAreas(noise: noise, descriptors: descriptors, quietness: quietness, visual_quality: visual_quality, accessibility: accessibility)
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyFilterGroupAreas: nil, status: errCode)
                        })
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    internal func getLastRank(){
        self.parameters = [ACCESS_TOKEN: User.AUTHENTICATION_TOKEN as AnyObject]
        self.manager.request(SurveyRouter.getLastRank(parameters: self.parameters!))
            .validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result{
                case .success(let value):
                    
                    let response = JSON(json: value)
                    let errCode = response[ERRORCODE].intValue
                    
                    if errCode == 0 {
                        let data = response[RESPONSE_DATA]
                        let lastRank = LastRank(json: data)
                        
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetLastRank: lastRank, status: errCode)
                        
                    } else if errCode == 401 {
                        self.renewToken(success: {
                            self.getLastRank()
                        }, failure: {
                            (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetLastRank: nil, status: errCode)
                        })
                    } else {
                        (self.delegate as! SurveyRequestDelegate).surveyRequest!(surveyRequest: self, didSuccessfullyGetLastRank: nil, status: errCode)
                    }
                case .failure(let error):
                    print(error)
                    (self.delegate as! SurveyRequestDelegate).requestFail!(message: self.errorMessageFromError(error: error))
                }
            })
    }
    
    // MARK: - Initialization
    override init(initType: InitType) {
        super.init(initType: initType)
    }
}

enum SurveyRouter: URLRequestConvertible {
    
    case renewToken(parameters: Parameters)
    case getGroupAreas(parameters:Parameters)
    case getQuietAreas(parameters:Parameters)
    case getRecentSurvey(parameters: Parameters)
    case getQuestionDetails(parameters: Parameters)
    case getSurvey(parameters: Parameters)
    case submitData(parameters: Parameters)
    case submitSurvey(parameters: Parameters)
    case uploadFile(parameters: Parameters)
    case requestDeletion(parameters: Parameters)
    case filterGroupAreas(parameters:Parameters)
    case getLeaderboard()
    case getLastRank(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .renewToken:
            return .post
        case .getGroupAreas:
            return .get
        case .getQuietAreas:
            return .get
        case .getRecentSurvey:
            return .get
        case .getQuestionDetails:
            return .get
        case .getSurvey:
            return .get
        case .submitData:
            return .post
        case .submitSurvey:
            return .post
        case .uploadFile:
            return .post
        case .requestDeletion:
            return .post
        case .filterGroupAreas:
            return .get
        case .getLeaderboard:
            return .get
        case .getLastRank:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .renewToken:
            return "renew_token"
        case .getGroupAreas:
            return "group_area"
        case .getQuietAreas:
            return "quiet_area"
        case .getRecentSurvey:
            return "recent_survey"
        case .getQuestionDetails:
            return "question_detail"
        case .getSurvey:
            return "get_survey"
        case .submitSurvey:
            return "submit_survey"
        case .submitData:
            return "submit_data"
        case .uploadFile:
            return "upload_file"
        case .requestDeletion:
            return "request_deletion"
        case .filterGroupAreas:
            return "filter_area"
        case .getLeaderboard:
            return "contributors"
        case .getLastRank:
            return "last_rank"
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try MAIN_URL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .renewToken(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .getGroupAreas(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .getQuietAreas(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .getRecentSurvey(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .getQuestionDetails(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .getSurvey(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .submitData(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .submitSurvey(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .uploadFile(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .requestDeletion(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .filterGroupAreas(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .getLeaderboard():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .getLastRank(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
