//
//  GetInterResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 31.12.2021.
//

import Foundation
import ObjectMapper

public class GetInterResponseModel: Mappable{
    var _id : String = ""
    var id : Int = 0
    var transferDate : String = ""
    var transferDateStr : String = ""
    var workNo : Int = 0
    var transferName : String = ""
    var meetinPoint : String = ""
    var guidePickupTime : String = ""
    var pickupDate : String = ""
    var pickupTime : String = ""
    var guideNote : String = ""
    var transferNote : String = ""
    var plate : String = ""
    var vehicleType : String = ""
    var serviceName : String = ""
    var typeInt : Int = 0
    var direction : String = ""
    var firstHotel : String = ""
    var lastHotel : String = ""
    var pax : String = ""

    required public init?(map: Map) {

    }

    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        transferDate <- map["TransferDate"]
        transferDateStr <- map["TransferDateStr"]
        workNo <- map["WorkNo"]
        transferName <- map["TransferName"]
        meetinPoint <- map["MeetinPoint"]
        guidePickupTime <- map["GuidePickupTime"]
        pickupDate <- map["PickupDate"]
        pickupTime <- map["PickupTime"]
        guideNote <- map["GuideNote"]
        transferNote <- map["TransferNote"]
        plate <- map["Plate"]
        vehicleType <- map["VehicleType"]
        serviceName <- map["ServiceName"]
        typeInt <- map["TypeInt"]
        direction <- map["Direction"]
        firstHotel <- map["FirstHotel"]
        lastHotel <- map["LastHotel"]
        pax <- map["Pax"]
    }
}
