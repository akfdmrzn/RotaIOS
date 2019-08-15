//
//  CustomerChangePasswordRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerChangePasswordRequestModel:Mappable{
    
    var customerId:Int!
    var oldPassword:String!
    var newPassword:String!

    required init?(map: Map) {
        
    }
    
    init(customerId:Int,address : String,oldPassword : String, newPassword : String) {
        self.customerId = customerId
        self.oldPassword = oldPassword
        self.newPassword = newPassword
    }
    
    func mapping(map: Map) {
        customerId <- map["CustomerId"]
        oldPassword <- map["OldPassword"]
        newPassword <- map["NewPassword"]
    }
    
}
