//
//  GetTripDetailByIdRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetTripDetailByIdRequestModel:Mappable{
    
    var id:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(id:String) {
        self.id = id
    }
    
    
    public func mapping(map: Map) {
        id <- map["ID"]
        
    }
}

