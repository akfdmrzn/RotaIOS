//
//  UpdateNoShowResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 19.01.2022.
//

import Foundation
import ObjectMapper

public class UpdateNoShowResponseModel : Mappable {
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
