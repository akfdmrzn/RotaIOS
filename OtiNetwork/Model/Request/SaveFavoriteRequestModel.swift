//
//  SaveFavoriteRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class SaveFavoriteRequestModel: Mappable {
    
    public var destinationId: Int!
    public var customerId: Int!
    public var excursionId: Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int?, destinationId: Int?, excursionId: Int?) {
        self.customerId = customerId
        self.destinationId = destinationId
        self.excursionId = excursionId
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        destinationId <- map["DestinationId"]
        excursionId <- map["ExcursionId"]
    }
    
}
