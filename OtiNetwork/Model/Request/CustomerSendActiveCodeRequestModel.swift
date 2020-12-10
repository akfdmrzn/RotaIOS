//
//  CustomerSendActiveCodeRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 30.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CustomerSendActiveCodeRequestModel:Mappable{
    
    public var email:String!
    public var mobilePhone:String!
    public var name:String!
    public var password:String!
    public var surname:String!
    public var companyId:Int!
    public var isResend:Bool!
    public var gender:Any!
    public var emailPermission: Bool!
    public var smsPermission: Bool!
    
    public required init?(map: Map) {
        
    }
    public init(email:String,mobilePhone:String,name : String,password : String,surname : String,companyId : Int,isResend : Bool,gender : Any, emailPermission: Bool, smsPermission: Bool) {
        self.email = email
        self.mobilePhone = mobilePhone
        self.name = name
        self.password = password
        self.surname = surname
        self.companyId = companyId
        self.isResend = isResend
        self.gender = gender
    }
    
    public func mapping(map: Map) {
        email <- map["Email"]
        mobilePhone <- map["MobilePhone"]
        name <- map["Name"]
        password <- map["Password"]
        surname <- map["Surname"]
        companyId <- map["CompanyId"]
        isResend <- map["IsResend"]
        gender <- map["Gender"]
        emailPermission <- map["EmailPermission"]
        smsPermission <- map["SmsPermission"]
    }
    
}

