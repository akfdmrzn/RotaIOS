//
//  ShortLogin.swift
//  BaseProject
//
//  Created by Bekir's Mac on 7.03.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginShortRequest:Mappable{
    
    var userEncrypted:String!
    
    required init?(map: Map) {
        
    }
    init(userEncrypted:String) {
        self.userEncrypted = userEncrypted
    }
    
    func mapping(map: Map) {
        userEncrypted <- map["UserEncrypted"]
    }
    
    
}

