//
//  GetGuideInfoOfTouristResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetGuideInfoOfTouristResponseModel : Mappable {
    public var rotaTouristId : Int = 0
    public var coralTouristId : Int = 0
    public var incomingId : Int = 0
    public var informationDate : String = ""
    public var informationDateString : String = ""
    public var informationTime : String = ""
    public var hotelId : Int = 0
    public var hotelName : String = ""
    public var guideId : Int = 0
    public var guideName : String = ""
    public var guidePhone : String = ""
    public var guideImageLink : String = ""
    public var speakTimeList : [SpeakTime] = []
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        rotaTouristId <- map["RotaTouristId"]
        coralTouristId <- map["CoralTouristId"]
        incomingId <- map["IncomingId"]
        informationDate <- map["InformationDate"]
        informationDateString <- map["InformationDateString"]
        informationTime <- map["InformationTime"]
        hotelId <- map["HotelId"]
        hotelName <- map["HotelName"]
        guideId <- map["GuideId"]
        guideName <- map["GuideName"]
        guidePhone <- map["GuidePhone"]
        guideImageLink <- map["GuideImageLink"]
        speakTimeList <- map["SpeakTime"]
    }
}
public class SpeakTime: Mappable {
    public var guideID = 0
    public var guideName = ""
    public var speakDate = ""
    public var speakDateString = ""
    public var startTime = ""
    public var endTime = ""
    public var hotelId = 0
    public var hotelName = ""
    
    
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        guideID <- map["GuideId"]
        guideName <- map["GuideName"]
        speakDate <- map["SpeakDate"]
        speakDateString <- map["SpeakDateString"]
        startTime <- map["StartTime"]
        endTime <- map["EndTime"]
        hotelId <- map["HotelId"]
        hotelName <- map["HotelName"]
        
    }
}
