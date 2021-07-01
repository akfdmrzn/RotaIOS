//
//  CalculateTotalPriceResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 1.07.2021.
//

import UIKit
import ObjectMapper

public class CalculateTotalPriceResponseModel: Mappable {
    public var totalAmount : Double?
    public var excursionsTotalAmount : Double?
    public var exrasTotalAmount : Double?
    public var currencyId : Int?
    public var currency : String?
    public var tourPlanId : Int?
    public var tourists : [TouristsList]?
    public var globalExtras : String?
    public var summary : Summary?

    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {

        totalAmount <- map["TotalAmount"]
        excursionsTotalAmount <- map["ExcursionsTotalAmount"]
        exrasTotalAmount <- map["ExrasTotalAmount"]
        currencyId <- map["CurrencyId"]
        currency <- map["Currency"]
        tourPlanId <- map["TourPlanId"]
        tourists <- map["Tourists"]
        globalExtras <- map["GlobalExtras"]
        summary <- map["Summary"]
    }

}

public class ExtrasList: Mappable,Decodable,Encodable {
    public var extraId : Int?
    public var priceId : Int?
    public var priceName : String?
    public var priceType : Int?
    public var amount : Double?
    public var extraTotalPaxCount : Int?

    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {

        extraId <- map["ExtraId"]
        priceId <- map["PriceId"]
        priceName <- map["PriceName"]
        priceType <- map["PriceType"]
        amount <- map["Amount"]
        extraTotalPaxCount <- map["ExtraTotalPaxCount"]
    }

}

public class Summary: Mappable,Decodable,Encodable {
    public var id : Int?
    public var importantNotes : String?
    public var excursionName : String?
    public var excursionLocalName : String?
    public var excursionType : String?
    public var excursionTypeKey : Int?
    public var includedServices : String?
    public var exculededServices : String?
    public var cancellationPolicy : String?
    public var height : Bool?
    public var serviceLanguageTrans : String?
    public var languageCode : String?

    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {

        id <- map["id"]
        importantNotes <- map["importantNotes"]
        excursionName <- map["excursionName"]
        excursionLocalName <- map["excursionLocalName"]
        excursionType <- map["excursionType"]
        excursionTypeKey <- map["excursionTypeKey"]
        includedServices <- map["includedServices"]
        exculededServices <- map["exculededServices"]
        cancellationPolicy <- map["cancellationPolicy"]
        height <- map["height"]
        serviceLanguageTrans <- map["serviceLanguageTrans"]
        languageCode <- map["languageCode"]
    }

}

public class TouristsList: Mappable,Decodable,Encodable {
    public var birthday : String?
    public var amount : Double?
    public var touristId : Int?
    public var reservationNo : String?
    public var type : Int?
    public var typeName : String?
    public var extras : [ExtrasList]?

    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {

        birthday <- map["Birthday"]
        amount <- map["Amount"]
        touristId <- map["TouristId"]
        reservationNo <- map["ReservationNo"]
        type <- map["Type"]
        typeName <- map["TypeName"]
        extras <- map["Extras"]
    }

}
