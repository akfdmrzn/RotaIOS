//
//  CustomerCreateRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//


//***************Dökümandaki yeni CustomerSendACtiveCodeASYNC requesti aslında bu request*****************
import UIKit
import ObjectMapper

class CustomerCreateRequestModel:Mappable{
    
    var email:String!
    var mobilePhone:String!
    var name:String!
    var password:String!
    var surname:String!
    var companyId:Int!
    var activeCode:String!
    
    required init?(map: Map) {
        
    }
    init(email:String,mobilePhone:String,name : String,password : String,surname : String,companyId : Int,activeCode : String) {
        self.email = email
        self.mobilePhone = mobilePhone
        self.name = name
        self.password = password
        self.surname = surname
        self.companyId = companyId
        self.activeCode = activeCode
    }
    
    func mapping(map: Map) {
        email <- map["Email"]
        mobilePhone <- map["MobilePhone"]
        name <- map["Name"]
        password <- map["Password"]
        surname <- map["Surname"]
        companyId <- map["CompanyId"]
        activeCode <- map["ActiveCode"]
    }
    
    
}
