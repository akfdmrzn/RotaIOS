//
//  GetStepDetailResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper

public class GetStepDetailResponseModel : Mappable {
    public var _id : String?
    public var ids : String?
    public var stepId : Int?
    public var companyId : Int?
    public var serviceId : Int?
    public var isExtraService : Bool?
    public var extraServiceId : Int?
    public var tourTransferPlanArrAndDepId : Int?
    public var serviceType : String?
    public var realAdult : Int?
    public var realChild : Int?
    public var realToodle : Int?
    public var realInfant : Int?
    public var freeAdult : Int?
    public var freeChild : Int?
    public var freeToodle : Int?
    public var freeInfant : Int?
    public var totalAdult : Int?
    public var totalChild : Int?
    public var totalToodle : Int?
    public var totalInfant : Int?
    public var realAmount : Int?
    public var realTotal : Double?
    public var freeAmount : Int?
    public var freeTotal : Double?
    public var totalAmount : Int?
    public var grandTotal : Double?
    public var iD : Int?
    public var action : Int?

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        _id <- map["$id"]
        ids <- map["Ids"]
        stepId <- map["StepId"]
        companyId <- map["CompanyId"]
        serviceId <- map["ServiceId"]
        isExtraService <- map["IsExtraService"]
        extraServiceId <- map["ExtraServiceId"]
        tourTransferPlanArrAndDepId <- map["TourTransferPlanArrAndDepId"]
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
        iD <- map["ID"]
        action <- map["Action"]
    }
}

public class GetStepDetail : NSObject {
    public var _id : String?
    public var ids : String?
    public var stepId : String?
    public var companyId : String?
    public var serviceId : String?
    public var isExtraService : String?
    public var extraServiceId : String?
    public var tourTransferPlanArrAndDepId : String?
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
    public var iD : String?
    public var action : String?
    
    public init(_id : String, ids: String, stepId: String, companyId: String, serviceId: String, isExtraService: String, extraServiceId: String, tourTransferPlanArrAndDepId: String, serviceType: String, realTotal: String, realAdult: String, realChild: String, realToodle: String, realInfant: String, freeAdult: String, freeChild: String, freeToodle: String, freeInfant: String, totalAdult: String, totalChild: String, totalToodle: String, totalInfant: String, realAmount: String, freeAmount: String, freeTotal: String, totalAmount: String, grandTotal: String, iD: String, action: String) {
        self._id = _id
        self.ids = ids
        self.stepId = stepId
        self.companyId = companyId
        self.serviceId = serviceId
        self.isExtraService = isExtraService
        self.extraServiceId = extraServiceId
        self.tourTransferPlanArrAndDepId = tourTransferPlanArrAndDepId
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
        self.iD = iD
        self.action = action
    }
}
