//
//  GetStepsForIndShopResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper
import UIKit

public class GetStepsForIndShopResponseModel : Mappable {
    public var _id : String?
    public var stepId : Int?
    public var ids : String?
    public var companyId : Int?
    public var stepName : String?
    public var serviceType : String?
    public var supplierName : String?
    public var realPax : String?
    public var sVPax : String?
    public var supplierType : Int?
    public var isSVCreatedBeforeForShopSupplier : Bool?
    public var realTotalPax : Int?
    public var realAdultPax : Int?
    public var realChildPax : Int?
    public var realInfantPax : Int?
    public var sVTotalPax : Int?
    public var sVAdultPax : Int?
    public var sVChildPax : Int?
    public var sVInfantPax : Int?
    public var iD : Int?
    public var action : Int?

    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        _id <- map["$id"]
        stepId <- map["StepId"]
        ids <- map["Ids"]
        companyId <- map["CompanyId"]
        stepName <- map["StepName"]
        serviceType <- map["ServiceType"]
        supplierName <- map["SupplierName"]
        realPax <- map["RealPax"]
        sVPax <- map["SVPax"]
        supplierType <- map["SupplierType"]
        isSVCreatedBeforeForShopSupplier <- map["IsSVCreatedBeforeForShopSupplier"]
        realTotalPax <- map["RealTotalPax"]
        realAdultPax <- map["RealAdultPax"]
        realChildPax <- map["RealChildPax"]
        realInfantPax <- map["RealInfantPax"]
        sVTotalPax <- map["SVTotalPax"]
        sVAdultPax <- map["SVAdultPax"]
        sVChildPax <- map["SVChildPax"]
        sVInfantPax <- map["SVInfantPax"]
        iD <- map["ID"]
        action <- map["Action"]
    }
}
