//
//  CustomerControlActivateCodeRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 2.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerControlActivateCodeRequestModel: Mappable {
    
    var mobilePhone:String!
    var activeCode:String!
    var email:String!
    
    required init?(map: Map) {
        
    }
    
    init(mobilePhone:String,activeCode : String,email: String) {
        self.mobilePhone = mobilePhone
        self.activeCode = activeCode
        self.email = email
    }
    
    func mapping(map: Map) {
        mobilePhone <- map["MobilePhone"]
        activeCode <- map["ActiveCode"]
        email <- map["Email"]
    }
}
