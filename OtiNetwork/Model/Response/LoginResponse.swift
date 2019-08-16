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
    public var id = 0
    public var name = ""
    public var surname = ""
    public var mail  = ""
    public var mobilePhone = ""
    public var userEncrypted = ""
    public var companyId = 0
    
    
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

