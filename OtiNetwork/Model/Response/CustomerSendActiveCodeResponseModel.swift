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
    
    public var id = 0
    public var name = ""
    public var email = ""
    public var mobilePhone = ""
    public var userEncrypted = ""
    public var surname = ""
    public var companyId  = 0
    public var activeCode  = ""
    
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

