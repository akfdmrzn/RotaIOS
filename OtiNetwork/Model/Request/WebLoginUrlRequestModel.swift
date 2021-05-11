//
//  WebLoginUrlRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 11.05.2021.
//

import Foundation
import ObjectMapper

public class WebLoginUrlRequestModel: Mappable{
    
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
