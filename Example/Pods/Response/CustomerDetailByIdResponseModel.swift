//
//  CustomerDetailByIdResponseModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerDetailByIdResponseModel: Mappable {
    
    var  id  = 0
    var  name  = ""
    var  email  = ""
    var  passportSerial  = ""
    var  passportNumber  = ""
    var  dateOfIssue  = ""
    var  dateOfIssueString  = ""
    var  issuedBy  = ""
    var  divisionCode  = ""
    var  mobilePhone  = ""
    var  address  = ""
    var  password  = ""
    var  isActive : Bool!
    var  activationDate  = ""
    var  activationDateString  = ""
    var  activationCode  = ""
    var  createDate  = ""
    var  createDateString  = ""
    var  birthday  = ""
    var  birthdayString  = ""
    var  phone2  = ""
    var  surname  = ""
    var  agency  = ""
    var  gender = 0
    var  allowCampaignMail = false
    var  companyID = 0
    var  allowCampaignSMS = false
    var  identityNumber  = ""
    var  isCookiePermission  = ""
    var  authorizationCompleted = false
    var  validationError = false
    var  validationErrorMessage  = ""
    
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
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

