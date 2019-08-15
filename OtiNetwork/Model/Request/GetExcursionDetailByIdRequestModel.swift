//
//  GetExcursionDetailByIdRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 16.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetExcursionDetailByIdRequestModel: Mappable {
    
    var incomingId: Int?
    var excursionId: Int?
    var customerId: Int?
    
    required init?(map: Map) {
        
    }
    
    init(incomingId: Int?, excursionId: Int?, customerId: Int?) {
        self.incomingId = incomingId
        self.excursionId = excursionId
        self.customerId = customerId
    }
    
    func mapping(map: Map) {
        excursionId <- map["ExcursionId"]
        incomingId <- map["IncomingId"]
        customerId <- map["CustomerId"]
    }
    
}
