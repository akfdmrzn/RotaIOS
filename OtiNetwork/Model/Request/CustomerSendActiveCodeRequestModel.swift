//
//  CustomerSendActiveCodeRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 30.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerSendActiveCodeRequestModel:Mappable{
    
    var email:String!
    var mobilePhone:String!
    var name:String!
    var password:String!
    var surname:String!
    var companyId:Int!
    var isResend:Bool!
    var gender:Int!
    
    required init?(map: Map) {
        
    }
    init(email:String,mobilePhone:String,name : String,password : String,surname : String,companyId : Int,isResend : Bool,gender : Int) {
        self.email = email
        self.mobilePhone = mobilePhone
        self.name = name
        self.password = password
        self.surname = surname
        self.companyId = companyId
        self.isResend = isResend
        self.gender = gender
    }
    
    func mapping(map: Map) {
        email <- map["Email"]
        mobilePhone <- map["MobilePhone"]
        name <- map["Name"]
        password <- map["Password"]
        surname <- map["Surname"]
        companyId <- map["CompanyId"]
        isResend <- map["IsResend"]
        gender <- map["Gender"]
    }
    
}

