//
//  GetPassportDetailResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 24.06.2021.
//

import UIKit
import ObjectMapper

public class GetPassportDetailResponseModel: Mappable {
    
    public var touristId : Int?
    public var operatorId : Int?
    public var name : String?
    public var surName : String?
    public var birthDate : String?
    public var passportSerie : String?
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
    
    public init(touristId: Int, operatorId: Int, name: String, surName: String, birthDate: String, passportSerie: String, passportNumber: String, nationalityName: String, genderName: String, countryOfBirthName: String, passportValidThru: String, passportGivenDate: String, documentTypeName: String,isPassportRequired : Bool) {
        self.touristId = touristId
        self.operatorId = operatorId
        self.name = name
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

        touristId <- map["TouristId"]
        operatorId <- map["OperatorId"]
        name <- map["Name"]
        surName <- map["SurName"]
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

