//
//  GetTransferResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 12.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetTransferResponseModel : Mappable {
    var id : Int?
    var transferDate : String?
    var transferDateString : String?
    var arrivalTransferDate : String?
    var arrivalTransferDateString : String?
    var transferType : String?
    var transferDirection : String?
    var fromPointName : String?
    var toPointName : String?
    var transferTime : String?
    var route : String?
    var departurePoint : String?
    var cancelStatus : String?
    var arrivalTransferTime : String?
    var departureTransferTime : String?
    var pickupTime : String?
    var pickupPoint : String?
    var vehiclePoint : String?
    var vehiclePlate : String?
    var guideName : String?
    var guidePhoneNumber : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id <- map["ID"]
        transferDate <- map["TransferDate"]
        transferDateString <- map["TransferDateString"]
        arrivalTransferDate <- map["ArrivalTransferDate"]
        arrivalTransferDateString <- map["ArrivalTransferDateString"]
        transferType <- map["TransferType"]
        transferDirection <- map["TransferDirection"]
        fromPointName <- map["FromPointName"]
        toPointName <- map["ToPointName"]
        transferTime <- map["TransferTime"]
        route <- map["Route"]
        departurePoint <- map["DeparturePoint"]
        cancelStatus <- map["CancelStatus"]
        arrivalTransferTime <- map["ArrivalTransferTime"]
        departureTransferTime <- map["DepartureTransferTime"]
        pickupTime <- map["PickupTime"]
        pickupPoint <- map["PickupPoint"]
        vehiclePoint <- map["VehiclePoint"]
        vehiclePlate <- map["VehiclePlate"]
        guideName <- map["GuideName"]
        guidePhoneNumber <- map["GuidePhoneNumber"]
    }
    
}
