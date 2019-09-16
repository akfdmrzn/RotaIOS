//
//  DeleteVoucherCustomerLinkRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 16.09.2019.
//

import Foundation
import ObjectMapper

public class DeleteVoucherCustomerLinkRequestModel: Mappable {
    
    public var voucherNumber:Int!
    public var customerId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber:Int,customerId :Int) {
        self.voucherNumber = voucherNumber
        self.customerId = customerId
    }
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        customerId <- map["CustomerId"]
        
    }
    
}
