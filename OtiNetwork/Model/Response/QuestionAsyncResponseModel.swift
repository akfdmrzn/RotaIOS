//
//  QuestionAsyncResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 1.06.2021.
//

import UIKit
import ObjectMapper

public class QuestionAsyncResponseModel : Mappable {
   public var questions : [Questions]?
   public var tourists : [TouristsSurvey]?
   public var hotels : [HotelsSurvey]?

    public required init?(map: Map) {

    }

    public  func mapping(map: Map) {
        questions <- map["Questions"]
        tourists <- map["Tourists"]
        hotels <- map["Hotels"]
    }
}

public class HotelsSurvey : Mappable {
    public var id : Int?
    public var name : String?
    public var touristId : Int?

    public required init?(map: Map) {

    }

    public func mapping(map: Map) {

        id <- map["Id"]
        name <- map["Name"]
        touristId <- map["TouristId"]
    }

}

public class Questions : Mappable {
   public var surveyId : Int?
   public var surveyName : String?
   public var surveyTypeId : Int?
   public var surveyGroupId : Int?
   public var questions : [Questions]?
   public var settings : Settings?
   public var isActive : Bool?
   public var rateEndOfDate : String?
   public var questionTypeId : Int?
    

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
        questionTypeId <- map["questionTypeId"]
    }

}


public class Settings : Mappable {
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

public class TouristsSurvey : Mappable {
   public var id : Int?
   public var gender : String?
   public var fullName : String?

    public required init?(map: Map) {

    }

    public func mapping(map: Map) {
        id <- map["Id"]
        gender <- map["Gender"]
        fullName <- map["FullName"]
    }

}
