//
//  CancelExcursionRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 3.08.2021.
//

import Foundation
import ObjectMapper

public class CancelExcursionRequestModel: Mappable{
    
    public var userId: Int?
    public var threadGuid: String?
    public var refundAmount: Double?
    public var refundCurrency: Double?
    public var penaltyAmount: Double?
    public var penaltyCurrency: Double?
    
    public required init?(map: Map) {
        
    }
    
    public init(userId: Int,threadGuid : String,refundAmount: Double,refundCurrency : Double,penaltyAmount : Double,penaltyCurrency : Double) {
        self.userId = userId
        self.threadGuid = threadGuid
        self.refundAmount = refundAmount
        self.refundCurrency = refundCurrency
        self.penaltyAmount = penaltyAmount
        self.penaltyCurrency = penaltyCurrency
    }
    
    public func mapping(map: Map) {
        userId <- map["UserId"]
        threadGuid <- map["ThreadGuid"]
        refundAmount <- map["refundAmount"]
        refundCurrency <- map["refundCurrency"]
        penaltyAmount <- map["penaltyAmount"]
        penaltyCurrency <- map["penaltyCurrency"]
    }
}
