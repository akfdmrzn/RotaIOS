//
//  GetUpdateSaleNoteforMobileResponseModel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 11.03.2022.
//


import Foundation
import ObjectMapper

public class GetUpdateSaleNoteforMobileResponseModel : Mappable {
    var isSuccesful: Bool = false
    var resultKey: String = ""
    var message: String = ""
    var detailMessage: String = ""

    required public init?(map: Map) {

    }
    
    public func mapping(map: Map) {
        isSuccesful <- map["IsSuccesful"]
        message <- map["Message"]
        resultKey <- map["ResultKey"]
        detailMessage <- map["DetailMessage"]
    }

}
