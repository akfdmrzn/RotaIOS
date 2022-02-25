//
//  GetHotelListForMobileResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 31.12.2021.
//

import Foundation
import ObjectMapper

public class GetHotelListForMobileResponseModel: Mappable{
    var _id : String = ""
    var id : Int = 0
    var time : String = ""
    var timeSpan : String = ""
    var market : String = ""
    var place : String = ""
    var hotelId : Int = 0
    var hotelName : String = ""
    var hotelMeetingPoint : String = ""
    var adultPlan : Int = 0
    var childPlan : Int = 0
    var toodlePlan : Int = 0
    var infantPlan : Int = 0
    var adultReel : Int = 0
    var childReel : Int = 0
    var toodleReel : Int = 0
    var infantReel : Int = 0
    var planPax : String = ""
    var reelPax : String = ""
    var shortCode : String = ""
    var isCol : Bool = false

    required public init?(map: Map) {

    }
    
    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        time <- map["Time"]
        timeSpan <- map["TimeSpan"]
        market <- map["Market"]
        place <- map["Place"]
        hotelId <- map["HotelId"]
        hotelName <- map["HotelName"]
        hotelMeetingPoint <- map["HotelMeetingPoint"]
        adultPlan <- map["AdultPlan"]
        childPlan <- map["ChildPlan"]
        toodlePlan <- map["ToodlePlan"]
        infantPlan <- map["InfantPlan"]
        adultReel <- map["AdultReel"]
        childReel <- map["ChildReel"]
        toodleReel <- map["ToodleReel"]
        infantReel <- map["InfantReel"]
        planPax <- map["PlanPax"]
        reelPax <- map["ReelPax"]
        shortCode <- map["ShortCode"]
        isCol <- map["IsCol"]
    }
}
