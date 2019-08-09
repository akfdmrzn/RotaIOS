//
//  GetFavoritesRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetFavoritesRequestModel: Mappable {
    
    var destinationIds: [Int]!
    var customerId: Int!
    
    required init?(map: Map) {
        
    }
    
    init(customerId: Int, destinationIds: [Int]) {
        self.customerId = customerId
        self.destinationIds = destinationIds
    }
    
    func mapping(map: Map) {
        customerId <- map["CustomerId"]
        destinationIds <- map["DestinationIds"]
    }
    
}
