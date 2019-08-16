//
//  CustomerSendActiveCodeResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 30.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CustomerSendActiveCodeResponseModel: Mappable {
    
    var id = 0
    var name = ""
    var email = ""
    var mobilePhone = ""
    var userEncrypted = ""
    var surname = ""
    var companyId  = 0
    var activeCode  = ""
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["customer.ID"]
        name <- map["customer.Name"]
        email <- map["customer.Email"]
        mobilePhone <- map["customer.MobilePhone"]
        surname <- map["customer.Surname"]
        userEncrypted <- map["customer.UserEncrypted"]
        companyId <- map["customer.CompanyId"]
        activeCode <- map["ActiveCode"]
    }
}

