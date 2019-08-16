//
//  GetNotificationSearchRequest.swift
//  BaseProject
//
//  Created by Akif Demirezen on 18.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetNotificationSearchRequestModel: Mappable {
    
    public var customerId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId:Int) {
        self.customerId = customerId
    }
    
    public func mapping(map: Map) {
        customerId <- map["CostumerId"]
    }
    
}
