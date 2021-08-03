//
//  CalculateRefundResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 3.08.2021.
//

import UIKit
import ObjectMapper

public class CalculateRefundResponseModel: Mappable {
    
    public var paymentAmount : PaymentAmount?
    public var paymentAmountLocal : PaymentAmountLocal?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        paymentAmount <- map["PaymentAmount"]
        paymentAmountLocal <- map["PaymentAmountLocal"]
    }
}

public class PaymentAmount: Mappable {
    
    public var refundAmount : Double?
    public var refundCurrency : Double?
    public var refundCurrencyCode : Double?
    public var penaltyAmount : Double?
    public var penaltyCurrencyCode : String?
    public var penaltyCurrency : Double?
    public var cancellationReasonId : Int?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        refundAmount <- map["refundAmount"]
        refundCurrency <- map["refundCurrency"]
        refundCurrencyCode <- map["refundCurrencyCode"]
        penaltyAmount <- map["penaltyAmount"]
        penaltyCurrencyCode <- map["penaltyCurrencyCode"]
        penaltyCurrency <- map["penaltyCurrency"]
        cancellationReasonId <- map["cancellationReasonId"]
    }
}

public class PaymentAmountLocal: Mappable {
    
    public var refundAmount : Double?
    public var refundCurrency : Double?
    public var refundCurrencyCode : Double?
    public var penaltyAmount : Double?
    public var penaltyCurrencyCode : String?
    public var penaltyCurrency : Double?
    public var cancellationReasonId : Int?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        refundAmount <- map["refundAmount"]
        refundCurrency <- map["refundCurrency"]
        refundCurrencyCode <- map["refundCurrencyCode"]
        penaltyAmount <- map["penaltyAmount"]
        penaltyCurrencyCode <- map["penaltyCurrencyCode"]
        penaltyCurrency <- map["penaltyCurrency"]
        cancellationReasonId <- map["cancellationReasonId"]
    }
}
