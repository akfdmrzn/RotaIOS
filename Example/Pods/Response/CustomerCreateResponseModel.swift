//
//  CustomerCreateResponse.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

 class CustomerCreateResponseModel:Mappable{
    
    
    
     var id = 0
     var name = ""
     var email = ""
     var mobilePhone = ""
     var userEncrypted = ""
     var surname = ""
     var companyId  = 0
    
     required init?(map: Map) {
        
    }
    
      func mapping(map: Map) {
        id <- map["ID"]
        name <- map["Name"]
        email <- map["Email"]
        mobilePhone <- map["MobilePhone"]
        surname <- map["Surname"]
        userEncrypted <- map["UserEncrypted"]
        companyId <- map["CompanyId"]
    }
    
}
