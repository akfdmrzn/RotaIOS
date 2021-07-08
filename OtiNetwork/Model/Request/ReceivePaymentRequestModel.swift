//
//  ReceivePaymentRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 21.06.2021.
//

import UIKit
import ObjectMapper

public class ReceivePaymentRequestModel: Mappable{
    
    public var userId : Int?
    public var payId : Int?
    public var card : ReceiveCardModel?
    public var excursion : ReceiveExcursionModel?
    public var calculateTotalPrice : CalculateTotalPriceResponseModel?
    
    public required init?(map: Map) {
        
    }
    
    public init(userId: Int, payId: Int,card : ReceiveCardModel,excursion : ReceiveExcursionModel,calculateTotalPrice : CalculateTotalPriceResponseModel) {
        self.userId = userId
        self.payId = payId
        self.card = card
        self.excursion = excursion
        self.calculateTotalPrice = calculateTotalPrice
    }

    public func mapping(map: Map) {
        userId <- map["UserId"]
        payId <- map["payId"]
        card <- map["card"]
        excursion <- map["excursion"]
        calculateTotalPrice <- map["calculateTotalPrice"]
    }
}

public class ReceiveCardModel: Mappable{
    
    public var creditCard : String?
    public var cvv : String?
    public var owner : String?
    public var cardMonth : String?
    public var cardYear : String?
    public var currencyCode : String?
    
    public required init?(map: Map) {
        
    }
    
    public init(creditCard: String,cvv : String,owner : String,cardMonth : String,cardYear : String,currencyCode : String) {
        self.creditCard = creditCard
        self.cvv = cvv
        self.owner = owner
        self.cardMonth = cardMonth
        self.cardYear = cardYear
        self.currencyCode = currencyCode
    }

    public func mapping(map: Map) {
        creditCard <- map["CreditCard"]
        cvv <- map["Cvv"]
        owner <- map["Owner"]
        cardMonth <- map["CardMonth"]
        cardYear <- map["CardYear"]
        currencyCode <- map["CurrencyCode"]
    }
}

public class ReceiveExcursionModel: Mappable{
    
    public var passaportId : [Int]?
    public var totalAmount : Double?
    public var checkOutDate : String?
    public var arrivalFlightDate : String?
    
    public required init?(map: Map) {
        
    }
    
    public init(passaportId: [Int],totalAmount : Double,checkOutDate : String,arrivalFlightDate : String) {
        self.passaportId = passaportId
        self.totalAmount = totalAmount
        self.checkOutDate = checkOutDate
        self.arrivalFlightDate = arrivalFlightDate
    }

    public func mapping(map: Map) {
        passaportId <- map["pasaportId"]
        totalAmount <- map["totalAmount"]
        checkOutDate <- map["checkoutDate"]
        arrivalFlightDate <- map["arrivalFlightDate"]
    }
}
