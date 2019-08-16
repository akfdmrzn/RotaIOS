//
//  CustomerCreateResponse.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

 public class CustomerCreateResponseModel:Mappable{
    
    
    
     public var id = 0
     public var name = ""
     public var email = ""
     public var mobilePhone = ""
     public var userEncrypted = ""
     public var surname = ""
     public var companyId  = 0
    
    public  required init?(map: Map) {
        
    }
    
     public  func mapping(map: Map) {
        id <- map["ID"]
        name <- map["Name"]
        email <- map["Email"]
        mobilePhone <- map["MobilePhone"]
        surname <- map["Surname"]
        userEncrypted <- map["UserEncrypted"]
        companyId <- map["CompanyId"]
    }
    
}
