//
//  GetTransferTypeListRequestModel.swift
//  OtiNetwork
//
//  Created by Cüneyt AYVAZ on 3.10.2019.
//

import Foundation
import ObjectMapper

class GetTransferTypeListRequestModel: Mappable{
    
    public var customerId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int) {
        self.customerId = customerId
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
    }
    
}
