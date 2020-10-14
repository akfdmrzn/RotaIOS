//
//  GetBonusLoyaltyRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 14.10.2020.
//

import Foundation
import ObjectMapper

public class GetBonusLoyaltyRequestModel: Mappable{
    
    public var customerId:String!
    public var gender:Int!
    public var name:String!
    public var surname:String!
    public var patronymic:String!
    public var dateofbirth:String!
    public var mobilePhone:String!
    public var city:String!
    public var email:String!
    public var rulesStatus:Bool!
    public var termsAndConditionStatus:Bool!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: String,gender : Int,name : String,surname:String,patronymic : String,dateofbirth : String,mobilePhone : String,city :String,email :String,rulesStatus : Bool,termsAndConditionStatus : Bool) {
        self.customerId = customerId
        self.gender = gender
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        self.dateofbirth = dateofbirth
        self.mobilePhone = mobilePhone
        self.city = city
        self.email = email
        self.rulesStatus = rulesStatus
        self.termsAndConditionStatus = termsAndConditionStatus
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        gender <- map["Gender"]
        name <- map["Name"]
        surname <- map["Surname"]
        patronymic <- map["Patronymic"]
        dateofbirth <- map["DateOfBirth"]
        mobilePhone <- map["MobilePhone"]
        city <- map["City"]
        email <- map["Email"]
        rulesStatus <- map["RulesStatus"]
        termsAndConditionStatus <- map["TeamsAndConditionStatus"]
    }
    
}
