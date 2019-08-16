//
//  GetTransferRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 12.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetTransferRequestModel : Mappable {
    var customerId : Int?
    var directionType : Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int?, directionType: Int?) {
        self.customerId = customerId
        self.directionType = directionType
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        directionType <- map["DirectionType"]
        
    }
}
