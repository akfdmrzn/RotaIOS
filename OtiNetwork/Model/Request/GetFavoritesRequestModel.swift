//
//  GetFavoritesRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetFavoritesRequestModel: Mappable {
    
    var destinationIds: [Int]!
    var customerId: Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int, destinationIds: [Int]) {
        self.customerId = customerId
        self.destinationIds = destinationIds
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        destinationIds <- map["DestinationIds"]
    }
    
}
