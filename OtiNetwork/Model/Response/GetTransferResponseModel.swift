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
    public var route : String?
    public var cancelStatus : String?
    public var departurePoint : String?
    public var departureTransferTime : String?
    public var vehiclePlate : String?
    public var guideName : String?
    public var guidePhoneNumber : String?
    public var arrivalGuideName: String?
    public var arrivalGuidePhone: String?
    public var arrivalVehiclePlate: String?
    public var departureGuideName: String?
    public var departureGuidePhone: String?
    public var departureVehiclePlate: String?
    
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
        route <- map["Route"]
        cancelStatus <- map["CancelStatus"]
        departurePoint <- map["DeparturePoint"]
        departureTransferTime <- map["DepartureTransferTime"]
        vehiclePlate <- map["VehiclePlate"]
        guideName <- map["GuideName"]
        guidePhoneNumber <- map["GuidePhoneNumber"]
        arrivalGuideName <- map["ArrivalGuideName"]
        arrivalGuidePhone <- map["ArrivalGuidePhone"]
        arrivalVehiclePlate <- map["ArrivalVehiclePlate"]
        departureGuideName <- map["DepartureGuideName"]
        departureGuidePhone <- map["DepartureGuidePhone"]
        departureVehiclePlate <- map["DepartureVehiclePlate"]
    }
    
}
