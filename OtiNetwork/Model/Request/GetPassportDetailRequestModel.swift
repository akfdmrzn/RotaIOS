//
//  GetPassportDetailRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 24.06.2021.
//

import UIKit
import ObjectMapper

public class GetPassportDetailRequestModel: Mappable {
    public var companyId : Int?
    public var voucherNumber : Int?
    public var turistInfo : [TuristInfo]?
    
    public required init?(map: Map) {
        
    }
    
    public init(companyId: Int, voucherNumber: Int, turistInfo: [TuristInfo]) {
        self.companyId = companyId
        self.voucherNumber = voucherNumber
        self.turistInfo = turistInfo
    }

    public func mapping(map: Map) {
        companyId <- map["CompanyId"]
        voucherNumber <- map["VoucherNumber"]
        turistInfo <- map["TuristInfo"]
    }
}

public class TuristInfo: Mappable,Decodable,Encodable{
    
    public var touristId: Int!
    public var operatorId: Int!
    public var voucherNumber: Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(touristId: Int, operatorId : Int,voucherNumber : Int) {
        self.touristId = touristId
        self.operatorId = operatorId
        self.voucherNumber = voucherNumber
    }
    
    public func mapping(map: Map) {
        touristId <- map["TouristId"]
        operatorId <- map["OperatorId"]
        voucherNumber <- map["VoucherNumber"]
    }
}

