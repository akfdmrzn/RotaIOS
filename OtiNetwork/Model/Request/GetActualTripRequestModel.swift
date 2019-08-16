//
//  GetActualTripRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetActualTripRequestModel:Mappable{
    
    public var customer:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(customer:String) {
        self.customer = customer
    }
    
    
    public func mapping(map: Map) {
        customer <- map["Customer"]
        
    }
}

