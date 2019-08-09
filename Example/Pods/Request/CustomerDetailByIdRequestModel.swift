//
//  CustomerDetailByIdRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerDetailByIdRequestModel:Mappable{
    
    var customerId:Int!
    
    required init?(map: Map) {
        
    }
    
    init(customerId:Int) {
        self.customerId = customerId
        
    }
    
    func mapping(map: Map) {
        customerId <- map["CustomerId"]
    }
    
}

