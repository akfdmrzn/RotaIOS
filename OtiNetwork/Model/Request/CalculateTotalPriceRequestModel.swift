//
//  CalculateTotalPriceRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 1.07.2021.
//

import UIKit
import ObjectMapper

public class CalculateTotalPriceRequestModel: Mappable {
    public var countryId : Int?
    public var excursionId : Int?
    public var excursionDate : String?
    public var saleDate : String?
    public var hotelId : Int?
    public var tourists : [Tourists]?
    public var flatExras : [String]?

    public required init?(map: Map) {
        
    }
    
    public init(countryId: Int, excursionId : Int, excursionDate : String, saleDate : String, hotelId : Int, tourists : [Tourists], flatExras : [String]) {
        self.countryId = countryId
        self.excursionId = excursionId
        self.excursionDate = excursionDate
        self.saleDate = saleDate
        self.hotelId = hotelId
        self.tourists = tourists
        self.flatExras = flatExras
    }
    
    public func mapping(map: Map) {

        countryId <- map["countryId"]
        excursionId <- map["excursionId"]
        excursionDate <- map["excursionDate"]
        saleDate <- map["saleDate"]
        hotelId <- map["hotelId"]
        tourists <- map["Tourists"]
        flatExras <- map["FlatExras"]
    }
}

public class Tourists : Mappable,Decodable,Encodable {
    public var touristId : Int?
    public var operatorId : Int?
    public var birthday : String?
    public var height : Bool?
    public var reservationNo : String?
    public var extras : [Extra]?

    public required init?(map: Map) {
        
    }
    
    public init(touristId: Int, operatorId : Int, birthday : String, height : Bool, reservationNo : String, extras : [Extra]) {
        self.touristId = touristId
        self.operatorId = operatorId
        self.birthday = birthday
        self.height = height
        self.reservationNo = reservationNo
        self.extras = extras
    }

    public func mapping(map: Map) {

        touristId <- map["TouristId"]
        operatorId <- map["OperatorId"]
        birthday <- map["Birthday"]
        height <- map["Height"]
        reservationNo <- map["ReservationNo"]
        extras <- map["Extras"]
    }
}

public class Extra : Mappable,Decodable,Encodable {
    public var extraId : Int?
    public var priceTypeId : Int?

    public required init?(map: Map) {
        
    }
    
    public init(extraId: Int, priceTypeId : Int) {
        self.extraId = extraId
        self.priceTypeId = priceTypeId
    }
    
    public func mapping(map: Map) {

        extraId <- map["ExtraId"]
        priceTypeId <- map["PriceTypeId"]
    }

}
