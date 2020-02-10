//
//  GetSaledExcursionInfoRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 19.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetSaledExcursionInfoRequestModel: Mappable {
    
    public var incomingId: Int?
    public var touristId: Int?
    public var customerId: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(incomingId: Int?, touristId: Int?, customerId: Int?) {
        self.incomingId = incomingId
        self.touristId = touristId
        self.customerId = customerId
    }
    
    public func mapping(map: Map) {
        incomingId <- map["IncomingId"]
        touristId <- map["TouristId"]
        customerId <- map["CustomerId"]
    }
    
}


