//
//  GetListRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class GetListRequestModel:Mappable{
    
    var customerId:Int!
    var tourId:String!
    
    required init?(map: Map) {
        
    }
    
    init(customerId:Int,tourId :String) {
        self.customerId = customerId
        self.tourId = tourId
    }
    
    
    func mapping(map: Map) {
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        
    }
}
