//
//  AddMoreTouristRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 17.06.2021.
//

import UIKit
import ObjectMapper

public class AddMoreTouristRequestModel: Mappable{
    
    public var countryId : Int?
    public var customerId : Int?
    public var excursionId : Int?
    public var companyId: Int?
    public var voucherNumber: Int?
    public var dateOfBirth: String?
    public var passportNumber: String?

    
    public required init?(map: Map) {
        
    }
    
    public init() {
        
    }
    
    public init(countryId: Int, customerId: Int, excursionId: Int, companyId: Int, voucherNumber: Int, dateOfBirth: String, passportNumber: String) {
        self.countryId = countryId
        self.customerId = customerId
        self.excursionId = excursionId
        self.companyId = companyId
        self.voucherNumber = voucherNumber
        self.dateOfBirth = dateOfBirth
        self.passportNumber = passportNumber
    }

    public func mapping(map: Map) {
        countryId <- map["CountryId"]
        customerId <- map["CustomerId"]
        excursionId <- map["ExcursionId"]
        companyId <- map["CompanyId"]
        voucherNumber <- map["VoucherNumber"]
        dateOfBirth <- map["DateOfBirth"]
        passportNumber <- map["PassportNumber"]
    }
    
}
