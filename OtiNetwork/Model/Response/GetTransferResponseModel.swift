//
//  GetTransferResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 12.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetTransferResponseModel : Mappable {
    public var id : Int?
    public var transferDate : String?
    public var transferDateString : String?
    public var arrivalTransferDate : String?
    public var arrivalTransferDateString : String?
    public var transferType : String?
    public var transferDirection : String?
    public var fromPointName : String?
    public var toPointName : String?
    public var transferTime : String?
    public var route : String?
    public var departurePoint : String?
    public var cancelStatus : String?
    public var arrivalTransferTime : String?
    public var departureTransferTime : String?
    public var pickupTime : String?
    public var pickupPoint : String?
    public var vehiclePoint : String?
    public var vehiclePlate : String?
    public var guideName : String?
    public var guidePhoneNumber : String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
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
