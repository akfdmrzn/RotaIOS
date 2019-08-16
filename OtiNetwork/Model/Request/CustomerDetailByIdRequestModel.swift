//
//  CustomerDetailByIdRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CustomerDetailByIdRequestModel:Mappable{
    
    var customerId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId:Int) {
        self.customerId = customerId
        
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
    }
    
}

