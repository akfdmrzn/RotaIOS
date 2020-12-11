//
//  CustomerControlActivateCodeRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 2.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CustomerControlActivateCodeRequestModel: Mappable {
    
    public var mobilePhone:String!
    public var activeCode:String!
    public var email:String!
    public var pushNotificationPermission: Bool!
    public var emailPermission: Bool!
    public var smsPermission: Bool!
    
    public required init?(map: Map) {
        
    }
    
    public init(mobilePhone:String,activeCode : String,email: String, pushNotificationPermission: Bool = true, emailPermission: Bool = true, smsPermission: Bool = true) {
        self.mobilePhone = mobilePhone
        self.activeCode = activeCode
        self.email = email
        self.pushNotificationPermission = pushNotificationPermission
        self.emailPermission = emailPermission
        self.smsPermission = smsPermission
    }
    
    public func mapping(map: Map) {
        mobilePhone <- map["MobilePhone"]
        activeCode <- map["ActiveCode"]
        email <- map["Email"]
        pushNotificationPermission <- map["PushNotificationPermission"]
        emailPermission <- map["EmailPermission"]
        smsPermission <- map["SmsPermission"]
    }
}
