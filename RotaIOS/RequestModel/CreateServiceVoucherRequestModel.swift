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

public class  CreateServiceVoucherPaxRequestModel : Mappable{
    public var ids : String!
    public var stepId : String!
    public var jsonStr : String!
    
    public required init?(map: Map) {
        
    }
    
    public init(ids : String, stepId: String, jsonStr: String) {
        self.ids = ids
        self.stepId = stepId
        self.jsonStr = jsonStr
    }
    
    public func mapping(map: Map) {
        jsonStr <- map["ids"]
        jsonStr <- map["stepId"]
        jsonStr <- map["jsonStr"]
    }
}

public class JsonModelList: Mappable{
    public var action : String?
    public var realToodle : String?
    public var realInfant : String?
    public var totalInfant : String?
    public var serviceId : String?
    public var isExtraService : String?
    public var realAdult : String?
    public var stepId : String?
    public var freeToodle : String?
    public var realChild : String?
    public var serviceType : String?
    public var freeInfant : String?
    public var ids : String?
    public var extraServiceId : String?
    public var ID : String?
    public var freeAmount : String?
    public var tourTransferPlanArrAndDepId : String?
    public var freeAdult : String?
    public var companyId : String?
    public var freeTotal : String?
    public var sV_CreatedBy : String?
    public var totalAmount : String?
    public var totalAdult : String?
    public var totalChild : String?
    public var realAmount : String?
    public var totalToodle : String?
    public var grandTotal : String?
    public var realTotal : String?
    public var freeChild : String?
    public var id : String?
    
    public required init?(map: Map) {

    }
    
    public init(serviceType: String, realTotal: String, realAdult: String, realChild: String, realToodle: String, realInfant: String, freeAdult: String, freeChild: String, freeToodle: String, freeInfant: String, totalAdult: String, totalChild: String, totalToodle: String, totalInfant: String, realAmount: String, freeAmount: String, freeTotal: String, totalAmount: String, grandTotal: String, action: String, serviceId: String, isExtraService: String, stepId: String, ids: String, extraServiceId: String, ID: String, tourTransferPlanArrAndDepId: String, companyId: String, sV_CreatedBy: String, id: String) {
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
        self.action = action
        self.serviceId = serviceId
        self.isExtraService = isExtraService
        self.stepId = stepId
        self.ids = ids
        self.extraServiceId = extraServiceId
        self.ID = ID
        self.tourTransferPlanArrAndDepId = tourTransferPlanArrAndDepId
        self.companyId = companyId
        self.sV_CreatedBy = sV_CreatedBy
        self.id = id
    }
    
    public func mapping(map: Map) {
        action <- map["Action"]
        realToodle <- map["RealToodle"]
        realInfant <- map["RealInfant"]
        totalInfant <- map["TotalInfant"]
        serviceId <- map["ServiceId"]
        isExtraService <- map["IsExtraService"]
        realAdult <- map["RealAdult"]
        stepId <- map["StepId"]
        freeToodle <- map["FreeToodle"]
        realChild <- map["RealChild"]
        serviceType <- map["ServiceType"]
        freeInfant <- map["FreeInfant"]
        ids <- map["Ids"]
        extraServiceId <- map["ExtraServiceId"]
        ID <- map["ID"]
        freeAmount <- map["FreeAmount"]
        tourTransferPlanArrAndDepId <- map["TourTransferPlanArrAndDepId"]
        freeAdult <- map["FreeAdult"]
        companyId <- map["CompanyId"]
        freeTotal <- map["FreeTotal"]
        sV_CreatedBy <- map["SV_CreatedBy"]
        totalAmount <- map["TotalAmount"]
        totalAdult <- map["TotalAdult"]
        totalChild <- map["TotalChild"]
        realAmount <- map["RealAmount"]
        totalToodle <- map["TotalToodle"]
        grandTotal <- map["GrandTotal"]
        realTotal <- map["RealTotal"]
        freeChild <- map["FreeChild"]
        id <- map["$id"]
    }
}

public class JsonModelPaxList : Mappable{
    public var _id : String = ""
    public var ids : String = ""
    public var stepId : String = "0"
    public var companyId : String = "0"
    public var tourTransferPlanArrAndDepId : String = ""
    public var realAdult : String = "0"
    public var realChild : String = "0"
    public var realToodle : String = "0"
    public var realInfant : String = "0"
    public var realTotal : String = "0"
    public var serviceType : String = "0"
    public var paxesList : [PaxesListStr] = []

    public required init?(map: Map) {
        
    }
    
    public init(_id : String, ids: String, stepId: String, companyId: String, tourTransferPlanArrAndDepId: String, realAdult: String, realChild: String, realToodle: String, realInfant: String, realTotal: String, serviceType: String, paxesLists: [PaxesListStr]) {
        self._id = _id
        self.ids = ids
        self.stepId = stepId
        self.companyId = companyId
        self.tourTransferPlanArrAndDepId = tourTransferPlanArrAndDepId
        self.realAdult = realAdult
        self.realChild = realChild
        self.realToodle = realToodle
        self.realInfant = realInfant
        self.realTotal = realTotal
        self.serviceType = serviceType
        self.paxesList = paxesLists
    }
    
    public func mapping(map: Map) {
        _id <- map["$id"]
        ids <- map["Ids"]
        stepId <- map["StepId"]
        companyId <- map["CompanyId"]
        tourTransferPlanArrAndDepId <- map["TourTransferPlanArrAndDepId"]
        realAdult <- map["RealAdult"]
        realChild <- map["RealChild"]
        realToodle <- map["RealToodle"]
        realInfant <- map["RealInfant"]
        serviceType <- map["ServiceType"]
        realTotal <- map["RealTotal"]
        paxesList <- map["PaxList"]
    }
}
