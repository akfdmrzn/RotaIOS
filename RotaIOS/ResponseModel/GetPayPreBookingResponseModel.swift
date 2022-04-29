//
//  GetPayPreBookingResponseModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 29.04.2022.
//

import Foundation
import ObjectMapper

struct GetPayPreBookingResponseModel : Mappable {
    var id : String?
    var record : Record?
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
