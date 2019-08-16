//
//  CustomerControlActivateCodeRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 2.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CustomerControlActivateCodeRequestModel: Mappable {
    
    var mobilePhone:String!
    var activeCode:String!
    var email:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(mobilePhone:String,activeCode : String,email: String) {
        self.mobilePhone = mobilePhone
        self.activeCode = activeCode
        self.email = email
    }
    
    public func mapping(map: Map) {
        mobilePhone <- map["MobilePhone"]
        activeCode <- map["ActiveCode"]
        email <- map["Email"]
    }
}
