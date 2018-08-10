//
//  API.swift
//  HushCity
//
//  Created by Huy Nguyễn on 10/31/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//
// MARK: - HUSHCITY_API_MAIN_ROUTES
#if RELEASE
    public let SCHEME = "https"
    public let HOST = "hushcity2.edge-works.net"
    public let WEB = "map.opensourcesoundscapes.org"
#else
    public let SCHEME = "https"
    public let HOST = "staginghushcity.edge-works.net"
    public let WEB = "staginghushcity.edge-works.net"
#endif

public let API_PATH = "/api2/"

public let DOMAIN_URL = "\(SCHEME)://\(HOST)"

public let MAIN_URL = "\(DOMAIN_URL)\(API_PATH)"

public let WEB_URL = "\(SCHEME)://\(WEB)"

// MARK: - COMMON_KEYS

public let USERNAME = "username"

public let PASSWORD = "password"

public let EMAIL = "email"

public let RESEND = "resend" // Resend verify email for registration - 0: change email, 1: resend email

public let OLDPASSWORD = "old_password"

public let AUTHORIZATION_HEADER = "Authorization"

public let ACCESS_TOKEN = "access_token"

public let REFRESH_TOKEN = "refresh_token"

public let VERIFY_TOKEN = "verify_token"

public let REQUEST_DATA = "data"

public let MULTIPART_FORM_FILE = "file"

public let IMAGES_NAME = "images"

public let AUDIOS_NAME = "audios"

public let IMAGE_FILE_NAME = "1.png"

public let AUDIO_FILE_NAME = "1.m4a"

public let IMAGE_MIME = "image/png"

public let AUDIO_MIME = "audio/m4a"

// Request Success
public let RESPONSE_DATA = "data"

// Request Fail
public let ERRORCODE = "err_code"

public let ERRORMESSAGE = "err_msg"

// Submit Feedback
public let RATING = "rating"

public let COMMENT = "comment"

// Submit Survey
public let LATITUDE = "lat"

public let LONGITUDE = "lng"

public let ACCURACY = "acc"

public let ADDRESS = "address"

public let NOISE_MIN = "noise_min"

public let NOISE_MAX = "noise_max"

public let NOISE_EQ = "noise_eq"

public let NOISE_STATUS = "noise_status"

public let TIME = "time"

public let DEVICE = "device"

public let DEVICE_UUID = "uuid"

public let DEVICE_MODEL = "model"

public let DATA_ID = "data_id"

public let QUESTIONS = "questions"

public let QUESTION_ID = "id"

public let QUESTION_CONTENT = "content"

public let QUESTION_ANSWER = "answer"

public let QUESTION_SECTION_ID = "section_id"

public let QUESTION_PARENT_ID = "parent_id"

public let RECENT_PAGE = "page"

public let RECENT_LIMIT = "limit"
