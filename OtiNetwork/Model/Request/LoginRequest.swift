//
//  LoginRequest.swift
//  BaseProject
//
//  Created by Bekir's Mac on 19.02.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginRequest:Mappable{
    
    var email:String!
    var password:String!
    
    required init?(map: Map) {
        
    }
    init(email:String,password:String) {
        self.email = email
        self.password = password
    }
    
    func mapping(map: Map) {
        email <- map["Email"]
        password <- map["Password"]
    }
    
    
}

