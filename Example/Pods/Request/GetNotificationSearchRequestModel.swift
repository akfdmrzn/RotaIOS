//
//  GetNotificationSearchRequest.swift
//  BaseProject
//
//  Created by Akif Demirezen on 18.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetNotificationSearchRequestModel: Mappable {
    
    var customerId:Int!
    
    required init?(map: Map) {
        
    }
    
    init(customerId:Int) {
        self.customerId = customerId
    }
    
    func mapping(map: Map) {
        customerId <- map["CostumerId"]
    }
    
}
