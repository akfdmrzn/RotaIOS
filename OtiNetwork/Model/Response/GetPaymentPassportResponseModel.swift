//
//  GetPaymentPassportResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 29.07.2021.
//

import UIKit
import ObjectMapper

public class GetPaymentPassportResponseModel: Mappable {
    
    public var touristId : Int?
    public var name : String?
    public var surname : String?
    public var birthDate : String?
    public var passportSerie : String?
    public var passportNumber : String?
    public var nationalityName : String?
    public var genderName : String?
    public var countryOfBirthName : String?
    public var passportValidThru : String?
    public var passportGivenDate : String?
    public var excursionVoucherNumber : String?
    public var documentTypeName : String?
    public var operatorId : Int?
    public var reservationNumber : String?
    public var editableArea : EditableArea?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        touristId <- map["TouristId"]
        name <- map["Name"]
        surname <- map["SurName"]
        birthDate <- map["BirthDate"]
        passportSerie <- map["PassportSerie"]
        passportNumber <- map["PassportNumber"]
        nationalityName <- map["NationalityName"]
        genderName <- map["GenderName"]
        countryOfBirthName <- map["CountryOfBirthName"]
        passportValidThru <- map["PassportValidThru"]
        passportGivenDate <- map["PassportGivenDate"]
        documentTypeName <- map["DocumentTypeName"]
        operatorId <- map["OpetatorId"]
        reservationNumber <- map["ReservationNumber"]
    }
}
public class EditableArea: Mappable {
    
    public var id : Int?
    public var birthDate : Bool?
    public var passport : Bool?
    public var room : Bool?
    public var paymentOption : Bool?
    public var touristName : Bool?
    public var touristSurname : Bool?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        id <- map["ID"]
        birthDate <- map["BirthDate"]
        passport <- map["Passport"]
        room <- map["Room"]
        paymentOption <- map["PaymentOption"]
        touristName <- map["TouristName"]
        touristSurname <- map["TouristSurname"]
    }
}
