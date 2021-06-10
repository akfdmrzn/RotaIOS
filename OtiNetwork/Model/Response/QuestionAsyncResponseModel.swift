//
//  QuestionAsyncResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 1.06.2021.
//

import UIKit
import ObjectMapper

public class QuestionAsyncResponseModel : Mappable,Decodable,Encodable {
    public var surveyList : [SurveyList]?
    public var hotels : [HotelsSurvey]?
    
    public required init?(map: Map) {
        
    }
    
    public  func mapping(map: Map) {
        surveyList <- map["Surveys"]
        hotels <- map["Hotels"]
    }
}

public class HotelsSurvey : Mappable,Decodable,Encodable {
    public var id : Int?
    public var name : String?
    public var touristId : Int?
    public var isSelected : Bool?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        id <- map["Id"]
        name <- map["Name"]
        touristId <- map["TouristId"]
    }
    
}

public class SurveyList : Mappable,Decodable,Encodable {
    public var surveyId : Int?
    public var surveyName : String?
    public var surveyTypeId : Int?
    public var surveyGroupId : Int?
    public var isActive : Bool?
    public var rateEndOfDate : String?
    public var questions : [Questions]?
    public var settings : Settings?
    public var tourists : [TouristsSurvey]?
    
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        surveyId <- map["surveyId"]
        surveyName <- map["surveyName"]
        surveyTypeId <- map["surveyTypeId"]
        surveyGroupId <- map["surveyGroupId"]
        questions <- map["questions"]
        settings <- map["settings"]
        isActive <- map["IsActive"]
        rateEndOfDate <- map["RateEndOfDate"]
        tourists <- map["Tourists"]
        
    }
    
}

public class Questions : Mappable,Decodable,Encodable {
    public var questionId : Int?
    public var questionText : String?
    public var questionType : String?
    public var questionTypeId : Int?
    public var answerList : [AnswerList]?
    public var likertScale : Int?
    public var order : Int?
    public var isSelected : Bool?
    public var value : Int? //for rate type
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        questionId <- map["questionId"]
        questionText <- map["questionText"]
        questionType <- map["questionType"]
        questionTypeId <- map["questionTypeId"]
        answerList <- map["answerList"]
        likertScale <- map["likertScale"]
        order <- map["order"]
        
    }
}


public class Settings : Mappable,Decodable,Encodable {
    public var settingId : Int?
    public var sendExactTime : String?
    public var totalNotificationNumber : Int?
    public var repeatEvery : Int?
    public var repeatPeriod : String?
    public var makeInactive : Int?
    public var makeInactivePeriod : String?
    public var eventTypeId : Int?
    public var eventTypeDesc : String?
    public var sendDay : Int?
    public var sendDayDesc : String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        settingId <- map["settingId"]
        sendExactTime <- map["sendExactTime"]
        totalNotificationNumber <- map["totalNotificationNumber"]
        repeatEvery <- map["repeatEvery"]
        repeatPeriod <- map["repeatPeriod"]
        makeInactive <- map["makeInactive"]
        makeInactivePeriod <- map["makeInactivePeriod"]
        eventTypeId <- map["eventTypeId"]
        eventTypeDesc <- map["eventTypeDesc"]
        sendDay <- map["sendDay"]
        sendDayDesc <- map["sendDayDesc"]
    }
    
}

public class TouristsSurvey : Mappable,Decodable,Encodable {
    public var id : Int?
    public var gender : String?
    public var fullName : String?
    public var isSelected : Bool?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["Id"]
        gender <- map["Gender"]
        fullName <- map["FullName"]
    }
    
}

public class AnswerList : Mappable,Decodable,Encodable {
    
    public var order : Int?
    public var text : String?
    public var answerId : Int?
    public var isSelected : Bool?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        answerId <- map["answerId"]
        order <- map["order"]
        text <- map["text"]
    }
    
}
