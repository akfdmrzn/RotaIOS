//
//  CheckMyTripRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class CheckMyTripRequestModel:Mappable{
    
    public var voucherNumber:Int!
    public var passportNumber:String!
    public var birthDate:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(voucherNumber:Int,passportNumber:String,birthDate : String) {
        self.voucherNumber = voucherNumber
        self.passportNumber = passportNumber
        self.birthDate = birthDate
    }
    
    
    public func mapping(map: Map) {
        voucherNumber <- map["VoucherNumber"]
        passportNumber <- map["PassportNumber"]
        birthDate <- map["BirthDate"]
    }
    
}