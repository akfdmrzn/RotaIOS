//
//  CreateServiceVoucherRequestModel.swift
//  RotaIOS
//
//  Created by odeon on 9.03.2022.
//

import Foundation
import UIKit
import ObjectMapper

public class  CreateServiceVoucherRequestModel : Mappable{
    public var ids : String!
    public var stepId : String!
    public var action : String!
    public var jsonStr : String!
    
    public required init?(map: Map) {
        
    }
    
    public init(ids : String, stepId: String, action: String, jsonStr: String) {
        self.ids = ids
        self.stepId = stepId
        self.action = action
        self.jsonStr = jsonStr
    }
    
    public func mapping(map: Map) {
        jsonStr <- map["ids"]
        jsonStr <- map["stepId"]
        jsonStr <- map["action"]
        jsonStr <- map["jsonStr"]
    }
}

public class JsonModelList: Mappable{
    public var serviceType : String?
    public var realAdult : String?
    public var realChild : String?
    public var realToodle : String?
    public var realInfant : String?
    public var freeAdult : String?
    public var freeChild : String?
    public var freeToodle : String?
    public var freeInfant : String?
    public var totalAdult : String?
    public var totalChild : String?
    public var totalToodle : String?
    public var totalInfant : String?
    public var realAmount : String?
    public var realTotal : String?
    public var freeAmount : String?
    public var freeTotal : String?
    public var totalAmount : String?
    public var grandTotal : String?
    
    public required init?(map: Map) {

    }
    
    public init(serviceType: String, realTotal: String, realAdult: String, realChild: String, realToodle: String, realInfant: String, freeAdult: String, freeChild: String, freeToodle: String, freeInfant: String, totalAdult: String, totalChild: String, totalToodle: String, totalInfant: String, realAmount: String, freeAmount: String, freeTotal: String, totalAmount: String, grandTotal: String) {
        self.serviceType = serviceType
        self.realAdult = realAdult
        self.realChild = realChild
        self.realToodle = realToodle
        self.realInfant = realInfant
        self.freeAdult = freeAdult
        self.freeChild = freeChild
        self.freeToodle = freeToodle
        self.freeInfant = freeInfant
        self.totalAdult = totalAdult
        self.totalChild = totalChild
        self.totalToodle = totalToodle
        self.totalInfant = totalInfant
        self.realAmount = realAmount
        self.realTotal = realTotal
        self.freeAmount = freeAmount
        self.freeTotal = freeTotal
        self.totalAmount = totalAmount
        self.grandTotal = grandTotal
    }
    
    public func mapping(map: Map) {
        serviceType <- map["ServiceType"]
        realAdult <- map["RealAdult"]
        realChild <- map["RealChild"]
        realToodle <- map["RealToodle"]
        realInfant <- map["RealInfant"]
        freeAdult <- map["FreeAdult"]
        freeChild <- map["FreeChild"]
        freeToodle <- map["FreeToodle"]
        freeInfant <- map["FreeInfant"]
        totalAdult <- map["TotalAdult"]
        totalChild <- map["TotalChild"]
        totalToodle <- map["TotalToodle"]
        totalInfant <- map["TotalInfant"]
        realAmount <- map["RealAmount"]
        realTotal <- map["RealTotal"]
        freeAmount <- map["FreeAmount"]
        freeTotal <- map["FreeTotal"]
        totalAmount <- map["TotalAmount"]
        grandTotal <- map["GrandTotal"]
    }
}
