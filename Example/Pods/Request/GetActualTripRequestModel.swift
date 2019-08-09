//
//  GetActualTripRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class GetActualTripRequestModel:Mappable{
    
    var customer:String!
    
    required init?(map: Map) {
        
    }
    
    init(customer:String) {
        self.customer = customer
    }
    
    
    func mapping(map: Map) {
        customer <- map["Customer"]
        
    }
}

