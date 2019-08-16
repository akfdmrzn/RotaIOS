//
//  LoginResponse.swift
//  BaseProject
//
//  Created by Bekir's Mac on 19.02.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class LoginResponse:Mappable{
    var id = 0
    var name = ""
    var surname = ""
    var mail  = ""
    var mobilePhone = ""
    var userEncrypted = ""
    var companyId = 0
    
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["ID"]
        name <- map["Name"]
        mail <- map["Email"]
        mobilePhone <- map["MobilePhone"]
        surname <- map["Surname"]
        userEncrypted <- map["UserEncrypted"]
        companyId <- map["CompanyId"]
    }
    
}

