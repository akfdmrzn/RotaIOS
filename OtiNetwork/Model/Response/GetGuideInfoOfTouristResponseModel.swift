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
    var rotaTouristId : Int = 0
    var coralTouristId : Int = 0
    var incomingId : Int = 0
    var informationDate : String = ""
    var informationDateString : String = ""
    var informationTime : String = ""
    var hotelId : Int = 0
    var hotelName : String = ""
    var guideId : Int = 0
    var guideName : String = ""
    var guidePhone : String = ""
    var guideImageLink : String = ""
    
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
    }
    
}
