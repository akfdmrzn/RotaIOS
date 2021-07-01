//
//  ExtrasAsyncResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 29.06.2021.
//

import UIKit
import ObjectMapper

public class ExtrasAsyncResponseModel: Mappable {
    
    public var extraId : Int?
    public var extraName : String?
    public var extraLocalName : String?
    public var priceType : String?
    public var priceTypeId : Int?
    public var isPaxes : Bool?
    public var price : Double?
    public var currency : String?
    public var currencyId : Int?
    public var required : Bool?
    public var mandotaryExtra : Int?
    public var minPerson : Int?
    public var flatAmount : Double?
    public var adultAmount : Double?
    public var childAmount : Double?
    public var toddleAmount : Double?
    public var infantAmount : Double?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        extraId <- map["extraId"]
        extraName <- map["extraName"]
        extraLocalName <- map["extraLocalName"]
        priceType <- map["priceType"]
        priceTypeId <- map["priceTypeId"]
        isPaxes <- map["isPaxes"]
        price <- map["price"]
        currency <- map["currency"]
        currencyId <- map["currencyId"]
        required <- map["required"]
        mandotaryExtra <- map["mandotaryExtra"]
        minPerson <- map["minPerson"]
        flatAmount <- map["flatAmount"]
        adultAmount <- map["adultAmount"]
        childAmount <- map["childAmount"]
        toddleAmount <- map["toddleAmount"]
        infantAmount <- map["infantAmount"]
    }
}
