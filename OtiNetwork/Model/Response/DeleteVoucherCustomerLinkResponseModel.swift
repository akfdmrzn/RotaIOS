//
//  DeleteVoucherCustomerLinkResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 16.09.2019.
//

import Foundation
import ObjectMapper

public class DeleteVoucherCustomerLinkResponseModel: Mappable {
    
    public var success:Bool!
    
    public required init?(map: Map) {
        
    }
    
    public init(success:Bool) {
        self.success = success
    }
    
    public func mapping(map: Map) {
        success <- map["Success"]
        
    }
    
}
