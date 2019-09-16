//
//  SaveVoucherCustomerLinkResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 16.09.2019.
//

import Foundation
import ObjectMapper

public class SaveVoucherCustomerLinkResponseModel : Mappable {
    public var id : Int = 0
    public var voucher : Int = 0
    public var customer : Int = 0
    public var touristId : Int = 0
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["ID"]
        voucher <- map["Voucher"]
        customer <- map["Customer"]
        voucher <- map["ID"]
        touristId <- map["TouristID"]
    }
    
}
