//
//  GetBirtDaysResponseModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 31.03.2022.
//
// "Id": 1, "Name": "sample string 2", "Market": "sample string 3", "AgeGroup": "sample string 4", "PaxType": "sample string 5"
import Foundation
import ObjectMapper

struct GetBirtDaysResponseModel : Mappable {
    var id : String?
    var Name : String?
    var Market : String?
    var AgeGroup : String?
    var PaxType : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        Name <- map["Name"]
        Market <- map["Market"]
        AgeGroup <- map["AgeGroup"]
        PaxType <- map["PaxType"]
    }
}

