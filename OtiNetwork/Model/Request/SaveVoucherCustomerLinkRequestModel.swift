//
//  SaveVoucherCustomerLinkRequestModel.swift
//  Alamofire
//
//  Created by Akif Demirezen on 16.09.2019.
//

import Foundation
import ObjectMapper

public class SaveVoucherCustomerLinkRequestModel: Mappable {
    
    public var voucherNumber:Int!
    public var customerId:Int!
    public var passportNumber:String!
    public var birthDate:String!
    public var name:String!
    public var surname:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber:Int,customerId :Int,passportNumber : String, birthDate : String){
        self.voucherNumber = voucherNumber
        self.customerId = customerId
        self.passportNumber = passportNumber
        self.birthDate = birthDate
    }
    
    public init(voucherNumber:Int,customerId :Int,passportNumber : String, birthDate : String,name : String,surname : String){
        self.voucherNumber = voucherNumber
        self.customerId = customerId
        self.passportNumber = passportNumber
        self.birthDate = birthDate
        self.name = name
        self.surname = surname
    }
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        customerId <- map["CustomerId"]
        passportNumber <- map["PassportNumber"]
        birthDate <- map["BirthDate"]
        name <- map["Name"]
        surname <- map["Surname"]
    }
}
