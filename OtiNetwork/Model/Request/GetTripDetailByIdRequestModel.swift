//
//  GetTripDetailByIdRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class GetTripDetailByIdRequestModel:Mappable{
    
    var id:String!
    
    required init?(map: Map) {
        
    }
    
    init(id:String) {
        self.id = id
    }
    
    
    func mapping(map: Map) {
        id <- map["ID"]
        
    }
}

