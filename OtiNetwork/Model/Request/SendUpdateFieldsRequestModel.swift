//
//  SendUpdateFieldsRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 30.07.2021.
//

import UIKit
import ObjectMapper

public class SendUpdateFieldsRequestModel: Mappable,Decodable,Encodable{
    
    public var threadGuid : String?
    public var touristId : Int?
    public var operatorId : Int?
    public var name : String?
    public var room : String?
    public var surName : String?
    public var birthDate : String?
    public var passportSerie : String?
    public var paymentOption : String?
    public var passportNumber : String?
    public var nationalityName : String?
    public var genderName : String?
    public var countryOfBirthName : String?
    public var passportValidThru : String?
    public var passportGivenDate : String?
    public var documentTypeName : String?
    public var isPassportRequired : Bool?
    
    public required init?(map: Map) {
        
    }
    
    public init() {
        
    }
    
    public init(threadGuid : String, touristId: Int, operatorId: Int,paymentOption : String, name: String, room : String,surName: String, birthDate: String, passportSerie: String, passportNumber: String, nationalityName: String, genderName: String, countryOfBirthName: String, passportValidThru: String, passportGivenDate: String, documentTypeName: String,isPassportRequired : Bool) {
        self.threadGuid = threadGuid
        self.touristId = touristId
        self.operatorId = operatorId
        self.name = name
        self.paymentOption = paymentOption
        self.room = room
        self.surName = surName
        self.birthDate = birthDate
        self.passportSerie = passportSerie
        self.passportNumber = passportNumber
        self.nationalityName = nationalityName
        self.genderName = genderName
        self.countryOfBirthName = countryOfBirthName
        self.passportValidThru = passportValidThru
        self.passportGivenDate = passportGivenDate
        self.documentTypeName = documentTypeName
        self.isPassportRequired = isPassportRequired
    }

    public func mapping(map: Map) {
        
        threadGuid <- map["ThreadGuid"]
        touristId <- map["TouristId"]
        operatorId <- map["OperatorId"]
        name <- map["TouristName"]
        room <- map["Room"]
        paymentOption <- map["PaymentOption"]
        surName <- map["TouristSurname"]
        birthDate <- map["BirthDate"]
        passportSerie <- map["PassportSerie"]
        passportNumber <- map["PassportNumber"]
        nationalityName <- map["NationalityName"]
        genderName <- map["GenderName"]
        countryOfBirthName <- map["CountryOfBirthName"]
        passportValidThru <- map["PassportValidThru"]
        passportGivenDate <- map["PassportGivenDate"]
        documentTypeName <- map["DocumentTypeName"]
        isPassportRequired <- map["isPassportRequired"]
    }
}
