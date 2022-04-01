//
//  GetStepDetail_ShopSupplierResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 7.03.2022.
//

import Foundation
import ObjectMapper

public class GetStepDetail_ShopSupplierResponseModel : Mappable,Decodable,Encodable {
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

public class PaxesList : Mappable,Decodable,Encodable {
    public var _id : String?
    public var oprShopPaxesID : Int?
    public var oprTouristID : String?
    public var paxNameSurname : String?
    public var operatorId : Int?
    public var operatorName : String?
    public var marketId : Int?
    public var marketName : String?
    public var paxType : String?
    public var unselectable : Bool?
    public var isGoShow : Bool?
    public var userSelected : Bool?

    public required init?(map: Map) {
        
    }
    
    public init(_id : String, oprShopPaxesID: Int, oprTouristID: String, paxNameSurname: String, operatorId: Int, operatorName: String, marketId: Int, marketName: String, paxType: String, unselectable: Bool, isGoShow: Bool, userSelected: Bool) {
        self._id = _id
        self.oprShopPaxesID = oprShopPaxesID
        self.oprTouristID = oprTouristID
        self.paxNameSurname = paxNameSurname
        self.operatorId = operatorId
        self.operatorName = operatorName
        self.marketId = marketId
        self.marketName = marketName
        self.paxType = paxType
        self.unselectable = unselectable
        self.isGoShow = isGoShow
        self.userSelected = userSelected
    }
    
    public func mapping(map: Map) {
        _id <- map["$id"]
        oprShopPaxesID <- map["OprShopPaxesID"]
        oprTouristID <- map["OprTouristID"]
        paxNameSurname <- map["PaxNameSurname"]
        operatorId <- map["OperatorId"]
        operatorName <- map["OperatorName"]
        marketId <- map["MarketId"]
        marketName <- map["MarketName"]
        paxType <- map["PaxType"]
        unselectable <- map["Unselectable"]
        isGoShow <- map["IsGoShow"]
        userSelected <- map["UserSelected"]
    }
}

public class GetStepDetailPaxesList : NSObject {
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
    public var paxesLists : [PaxesLists] = []
    
    public init(_id : String, ids: String, stepId: Int, companyId: Int, tourTransferPlanArrAndDepId: String, realAdult: Int, realChild: Int, realToodle: Int, realInfant: Int, realTotal: Int, paxesLists: [PaxesLists]) {
        self._id = _id
        self.ids = ids
        self.companyId = companyId
        self.tourTransferPlanArrAndDepId = tourTransferPlanArrAndDepId
        self.realAdult = realAdult
        self.realChild = realChild
        self.realToodle = realToodle
        self.realInfant = realInfant
        self.realTotal = realTotal
        self.paxesLists = paxesLists
    }
}

public class PaxesLists : NSObject {
    public var _id : String?
    public var oprShopPaxesID : String?
    public var oprTouristID : String?
    public var paxNameSurname : String?
    public var operatorId : String?
    public var operatorName : String?
    public var marketId : String?
    public var marketName : String?
    public var paxType : String?
    public var unselectable : String?
    public var isGoShow : String?
    public var userSelected : String?
    public var check: Bool?
    
    public init(_id : String, oprShopPaxesID: String, oprTouristID: String, paxNameSurname: String, operatorId: String, operatorName: String, marketId: String, marketName: String, paxType: String, unselectable: String, isGoShow: String, userSelected: String, check: Bool) {
        self._id = _id
        self.oprShopPaxesID = oprShopPaxesID
        self.oprTouristID = oprTouristID
        self.paxNameSurname = paxNameSurname
        self.operatorId = operatorId
        self.operatorName = operatorName
        self.marketId = marketId
        self.marketName = marketName
        self.paxType = paxType
        self.unselectable = unselectable
        self.isGoShow = isGoShow
        self.userSelected = userSelected
        self.check = check
    }
}

public class PaxesListStr : Mappable,Decodable,Encodable {
    public var _id : String?
    public var oprShopPaxesID : String?
    public var oprTouristID : String?
    public var paxNameSurname : String?
    public var operatorId : String?
    public var operatorName : String?
    public var marketId : String?
    public var marketName : String?
    public var paxType : String?
    public var unselectable : String?
    public var isGoShow : String?
    public var userSelected : String?

    public required init?(map: Map) {
        
    }
    
    public init(_id : String, oprShopPaxesID: String, oprTouristID: String, paxNameSurname: String, operatorId: String, operatorName: String, marketId: String, marketName: String, paxType: String, unselectable: String, isGoShow: String, userSelected: String) {
        self._id = _id
        self.oprShopPaxesID = oprShopPaxesID
        self.oprTouristID = oprTouristID
        self.paxNameSurname = paxNameSurname
        self.operatorId = operatorId
        self.operatorName = operatorName
        self.marketId = marketId
        self.marketName = marketName
        self.paxType = paxType
        self.unselectable = unselectable
        self.isGoShow = isGoShow
        self.userSelected = userSelected
    }
    
    public func mapping(map: Map) {
        _id <- map["$id"]
        oprShopPaxesID <- map["OprShopPaxesID"]
        oprTouristID <- map["OprTouristID"]
        paxNameSurname <- map["PaxNameSurname"]
        operatorId <- map["OperatorId"]
        operatorName <- map["OperatorName"]
        marketId <- map["MarketId"]
        marketName <- map["MarketName"]
        paxType <- map["PaxType"]
        unselectable <- map["Unselectable"]
        isGoShow <- map["IsGoShow"]
        userSelected <- map["UserSelected"]
    }
}
