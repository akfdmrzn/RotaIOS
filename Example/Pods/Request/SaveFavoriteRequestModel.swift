//
//  SaveFavoriteRequestModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 8.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class SaveFavoriteRequestModel: Mappable {
    
    var destinationId: Int!
    var customerId: Int!
    var excursionId: Int!
    
    required init?(map: Map) {
        
    }
    
    init(customerId: Int?, destinationId: Int?, excursionId: Int?) {
        self.customerId = customerId
        self.destinationId = destinationId
        self.excursionId = excursionId
    }
    
    func mapping(map: Map) {
        customerId <- map["CustomerId"]
        destinationId <- map["DestinationId"]
        excursionId <- map["ExcursionId"]
    }
    
}
