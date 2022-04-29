//
//  GetPreBookingResponseModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 27.04.2022.
//

import Foundation
import ObjectMapper

struct GetPreBookingResponseModel : Mappable {
    var id : String?
    var record : PreRecord?
    var isSuccesful : Bool?
    var resultKey : String?
    var message : String?
    var detailMessage : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        record <- map["Record"]
        isSuccesful <- map["IsSuccesful"]
        resultKey <- map["ResultKey"]
        message <- map["Message"]
        detailMessage <- map["DetailMessage"]
    }
}

struct PreRecord : Mappable {
    var id : String?
    var excursionName : String?
    var localName : String?
    var excDate : String?
    var totalExcursionAmount : Double?
    var totalExcAmountCurrencyId : Int?
    var currency : String?
    var paxes : String?
    var paxesId : String?
    var extras : [PreBookingExtras]?
    var saleStatus : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        excursionName <- map["ExcursionName"]
        localName <- map["LocalName"]
        excDate <- map["ExcDate"]
        totalExcursionAmount <- map["TotalExcursionAmount"]
        totalExcAmountCurrencyId <- map["TotalExcAmountCurrencyId"]
        currency <- map["Currency"]
        paxes <- map["Paxes"]
        paxesId <- map["PaxesId"]
        extras <- map["Extras"]
        saleStatus <- map["SaleStatus"]
    }

}

struct PreBookingExtras : Mappable {
    var id : String?
    var extraName : String?
    var paxes : String?
    var paxesId : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        extraName <- map["ExtraName"]
        paxes <- map["Paxes"]
        paxesId <- map["PaxesId"]
    }

}
