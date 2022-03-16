//
//  GetStepDetail_ArrDepH2HResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper

public class GetStepDetail_ArrDepH2HResponseModel : Mappable {
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
