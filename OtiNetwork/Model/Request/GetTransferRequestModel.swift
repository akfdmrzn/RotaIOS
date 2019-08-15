//
//  GetTransferRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 12.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetTransferRequestModel : Mappable {
    var customerId : Int?
    var directionType : Int?
    
    required init?(map: Map) {
        
    }
    
    init(customerId: Int?, directionType: Int?) {
        self.customerId = customerId
        self.directionType = directionType
    }
    
    func mapping(map: Map) {
        customerId <- map["CustomerId"]
        directionType <- map["DirectionType"]
        
    }
}
