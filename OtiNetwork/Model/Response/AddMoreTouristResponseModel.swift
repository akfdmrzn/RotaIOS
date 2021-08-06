//
//  AddMoreTouristResponseModel.swift
//  OtiNetwork
//
//  Created by odeon on 17.06.2021.
//

import UIKit
import ObjectMapper

public class AddMoreTouristResponseModel: Mappable {
    
    public var id : Int?
    public var fullName : String?
    public var gender : String?
    public var dateOfBirth : String?
    public var askForHeight : Bool?
    public var voucherNumber : Int?
    public var operatorId : Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(id: Int, fullName: String, gender: String, dateOfBirth: String, askForHeight: Bool,voucherNumber : Int,operatorId : Int) {
        self.id = id
        self.fullName = fullName
        self.gender = gender
        self.dateOfBirth = dateOfBirth
        self.askForHeight = askForHeight
        self.voucherNumber = voucherNumber
        self.operatorId = operatorId
    }

    public func mapping(map: Map) {
        id <- map["Id"]
        fullName <- map["FullName"]
        gender <- map["Gender"]
        dateOfBirth <- map["DateOfBirth"]
        askForHeight <- map["AskForHeight"]
        voucherNumber <- map["VoucherNumber"]
        voucherNumber <- map["OperatorId"]
    }
}
