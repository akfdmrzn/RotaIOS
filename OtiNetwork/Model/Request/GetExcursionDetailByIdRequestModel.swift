//
//  GetExcursionDetailByIdRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 16.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetExcursionDetailByIdRequestModel: Mappable {
    
    var incomingId: Int?
    var excursionId: Int?
    var customerId: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(incomingId: Int?, excursionId: Int?, customerId: Int?) {
        self.incomingId = incomingId
        self.excursionId = excursionId
        self.customerId = customerId
    }
    
    public func mapping(map: Map) {
        excursionId <- map["ExcursionId"]
        incomingId <- map["IncomingId"]
        customerId <- map["CustomerId"]
    }
    
}
