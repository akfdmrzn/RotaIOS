//
//  GetPhoneNumberListRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetPhoneNumberListRequestModel:Mappable{
    
    public var companyId:Int!
    public var languageId:Int!
    public var incomingId:Int!
    public var coralTouristId:Int!
    public var areaName:String!
    public var flightStartDate:String!
    public var flightEndDate:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(companyId:Int,languageId :Int,incomingId : Int,coralTouristId : Int,areaName : String,flightStartDate : String,flightEndDate : String) {
        self.companyId = companyId
        self.languageId = languageId
        self.incomingId = incomingId
        self.coralTouristId = coralTouristId
        self.areaName = areaName
        self.flightStartDate = flightStartDate
        self.flightEndDate = flightEndDate
    }
    
    
    public func mapping(map: Map) {
        companyId <- map["CompanyId"]
        languageId <- map["LanguageId"]
        coralTouristId <- map["CoralTouristId"]
        incomingId <- map["IncomingId"]
        areaName <- map["AreaName"]
        flightStartDate <- map["FlightStartDate"]
        flightEndDate <- map["FlightEndDate"]
        
    }
}

