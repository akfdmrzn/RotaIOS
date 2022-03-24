//
//  GetStepDetail_ArrDepH2H_ShopSupplierResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper

public class GetStepDetail_ArrDepH2H_ShopSupplierResponseModel : Mappable {
    public var _id : String?
    public var ids : String?
    public var stepId : Int?
    public var companyId : Int?
    public var tourTransferPlanArrAndDepId : String?
    public var realAdult : Int?
    public var realChild : Int?
    public var realToodle : Int?
    public var realInfant : Int?
    public var realTotal : Int?
    public var paxesList : [PaxesList]?

    public required init?(map: Map) {
        
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
        realTotal <- map["RealTotal"]
        paxesList <- map["PaxList"]
    }
}
