//
//  CustomerDetailByIdResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CustomerDetailByIdResponseModel: Mappable {
    
    public var  id  = 0
    public var  name  = ""
    public var  email  = ""
    public var  passportSerial  = ""
    public var  passportNumber  = ""
    public var  dateOfIssue  = ""
    public var  dateOfIssueString  = ""
    public var  issuedBy  = ""
    public var  divisionCode  = ""
    public var  mobilePhone  = ""
    public var  address  = ""
    public var  password  = ""
    public var  isActive : Bool!
    public var  activationDate  = ""
    public var  activationDateString  = ""
    public var  activationCode  = ""
    public var  createDate  = ""
    public var  createDateString  = ""
    public var  birthday  = ""
    public var  birthdayString  = ""
    public var  phone2  = ""
    public var  surname  = ""
    public var  agency  = ""
    public var  gender = 0
    public var  allowCampaignMail = false
    public var  companyID = 0
    public var  allowCampaignSMS = false
    public var  identityNumber  = ""
    public var  isCookiePermission  = ""
    public var  authorizationCompleted = false
    public var  validationError = false
    public var  validationErrorMessage  = ""
    
    
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["ID"]
        name <- map["Name"]
        email <- map["Email"]
        passportSerial <- map["PassportSerial"]
        passportNumber <- map["123123"]
        dateOfIssue <- map["DateOfIssue"]
        dateOfIssueString <- map["DateOfIssueString"]
        issuedBy <- map["IssuedBy"]
        divisionCode <- map["DivisionCode"]
        mobilePhone <- map["MobilePhone"]
        address <- map["Address"]
        password <- map["Password"]
        isActive <- map["IsActive"]
        activationDate <- map["ActivationDate"]
        activationDateString <- map["ActivationDateString"]
        activationCode <- map["ActivationCode"]
        createDate <- map["CreateDate"]
        createDateString <- map["CreateDateString"]
        birthday <- map["Birthday"]
        birthdayString <- map["BirthdayString"]
        phone2 <- map["Phone2"]
        surname <- map["Surname"]
        agency <- map["Agency"]
        gender <- map["Gender"]
        allowCampaignMail <- map["AllowCampaignMail"]
        companyID <- map["CompanyId"]
        allowCampaignSMS <- map["AllowCampaignSms"]
        identityNumber <- map["IdentityNumber"]
        isCookiePermission <- map["IsCookiePermission"]
        authorizationCompleted <- map["AuthorizationCompleted"]
        validationError <- map["ValidationError"]
        validationErrorMessage <- map["ValidationErrorMessage"]
        
        
    }
}

