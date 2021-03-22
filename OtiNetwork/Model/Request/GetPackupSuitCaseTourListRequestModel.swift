//
//  GetPackupSuitCaseTourListRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 22.03.2021.
//

import Foundation
import ObjectMapper

public class GetPackupSuitCaseTourListRequestModel: Mappable{
    
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
