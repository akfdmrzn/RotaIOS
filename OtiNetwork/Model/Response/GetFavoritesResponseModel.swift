//
//  GetFavoritesResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetFavoritesResponseModel: Mappable {
    
    var destinationId = 0
    var customerId = 0
    var excursionId = 0
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        destinationId <- map["DestinationId"]
        excursionId <- map["ExcursionId"]
    }
}
