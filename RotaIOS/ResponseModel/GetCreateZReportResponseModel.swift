//
//  GetCreateZReportResponseModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 7.11.2021.
//

import Foundation
import ObjectMapper

struct GetCreateZReportResponseModel : Mappable {
    var id : String?
    var record : Int?
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
