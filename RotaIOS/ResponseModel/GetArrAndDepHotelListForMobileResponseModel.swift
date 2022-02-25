//
//  GetArrAndDepHotelListForMobileResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 31.12.2021.
//

import Foundation
import ObjectMapper

public class GetArrAndDepHotelListForMobileResponseModel: Mappable,Decodable,Encodable{
    public var _id : String = ""
    public var id : Int = 0
    public var hotelId : Int = 0
    public var hotel : String = ""
    public var pickUpTime : String = ""
    public var planPax : String = ""
    public var reelPax : String = ""
    public var flightInfo : [FlightInfo] = []
    public var shortCode : String = ""
    public var flightInfoStr : String = ""
    public var transferDateStr : String = ""
    public var pickUpDateStr : String = ""
    public var guidePickUpTimeStr : String = ""
    public var pickUpTimeStr : String = ""

    public required init?(map: Map) {

    }
    
    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        hotelId <- map["HotelId"]
        hotel <- map["Hotel"]
        pickUpTime <- map["PickUpTime"]
        planPax <- map["PlanPax"]
        reelPax <- map["ReelPax"]
        flightInfo <- map["FlightInfo"]
        shortCode <- map["ShortCode"]
        flightInfoStr <- map["FlightInfoStr"]
        transferDateStr <- map["TransferDateStr"]
        pickUpDateStr <- map["PickUpDateStr"]
        guidePickUpTimeStr <- map["GuidePickUpTimeStr"]
        pickUpTimeStr <- map["PickUpTimeStr"]
    }
}

public class FlightInfo : Mappable,Decodable,Encodable {
    public var _id : String?
    public var fligtCode : String?
    public var direction : String?
    public var timeStr : String?

    public required init?(map: Map) {

    }
    
    public func mapping(map: Map) {

        _id <- map["$id"]
        fligtCode <- map["FligtCode"]
        direction <- map["Direction"]
        timeStr <- map["TimeStr"]
    }

}

public class HotelList : NSObject {
    public var hotel : String = "-"
    public var place : String = "-"
    public var date : String = "-"
    public var time : String = "-"
    public var info : String = "-"
    public var title1 : String = "-"
    public var title2 : String = "-"
    public var title3 : String = "-"
    public var title4 : String = "-"
    public var body1 : String = "-"
    public var body2 : String = "-"
    public var body3 : String = "-"
    public var body4 : String = "-"
    
    public required init?(map: Map) {
    }
    
    public init(hotel: String, place: String, date: String, time: String, info: String, title1:String, title2 : String, title3 :String, title4 : String, body1 : String, body2 :String, body3: String, body4: String) {
        self.hotel = hotel
        self.place = place
        self.date = date
        self.time = time
        self.info = info
        self.title1 = title1
        self.title2 = title2
        self.title3 = title3
        self.title4 = title4
        self.body1 = body1
        self.body2 = body2
        self.body3 = body3
        self.body4 = body4
    }
}
