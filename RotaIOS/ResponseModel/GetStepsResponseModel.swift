//
//  GetStepsResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper
import UIKit

public class GetStepsResponseModel : Mappable {
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

public class StepsList : NSObject {
    public var _id : String?
    public var stepId : String?
    public var ids : String?
    public var companyId : String?
    public var stepName : String?
    public var serviceType : String?
    public var supplierName : String?
    public var realPax : String?
    public var sVPax : String?
    public var supplierType : String?
    public var isSVCreatedBeforeForShopSupplier : String?
    public var realTotalPax : String?
    public var realAdultPax : String?
    public var realChildPax : String?
    public var realInfantPax : String?
    public var sVTotalPax : String?
    public var sVAdultPax : String?
    public var sVChildPax : String?
    public var sVInfantPax : String?
    public var iD : String?
    public var action : String?
    
    public init(_id : String, stepId: String, ids: String, companyId: String, stepName: String, serviceType: String, supplierName: String, realPax: String, sVPax: String, supplierType: String, isSVCreatedBeforeForShopSupplier: String, realTotalPax: String, realAdultPax: String, realChildPax: String, realInfantPax: String, sVTotalPax: String, sVAdultPax: String, sVChildPax: String, sVInfantPax: String, iD: String, action: String) {
        self._id = _id
        self.stepId = stepId
        self.ids = ids
        self.companyId = companyId
        self.stepName = stepName
        self.serviceType = serviceType
        self.supplierName = supplierName
        self.realPax = realPax
        self.sVPax = sVPax
        self.supplierType = supplierType
        self.isSVCreatedBeforeForShopSupplier = isSVCreatedBeforeForShopSupplier
        self.realTotalPax = realTotalPax
        self.realAdultPax = realAdultPax
        self.realChildPax = realChildPax
        self.realInfantPax = realInfantPax
        self.sVTotalPax = sVTotalPax
        self.sVAdultPax = sVAdultPax
        self.sVChildPax = sVChildPax
        self.sVInfantPax = sVInfantPax
        self.iD = iD
        self.action = action
    }
}
