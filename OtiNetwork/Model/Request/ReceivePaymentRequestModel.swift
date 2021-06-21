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
    public var excursionId : Int?
    public var creditCard : String?
    public var cvv : String?
    public var owner : String?
    public var cardMonth : String?
    public var cardYear : String?
    public var currencyCode : String?
    public var amount : Double?
    
    public required init?(map: Map) {
        
    }
    
    public init(userId: Int, excursionId: Int, creditCard: String, cvv: String, owner: String, cardMonth: String, cardYear: String, currencyCode: String, amount: Double) {
        self.userId = userId
        self.excursionId = excursionId
        self.creditCard = creditCard
        self.cvv = cvv
        self.owner = owner
        self.cardMonth = cardMonth
        self.cardYear = cardYear
        self.currencyCode = currencyCode
        self.amount = amount
    }

    public func mapping(map: Map) {
        userId <- map["CheckMyTripId"]
        excursionId <- map["ExcursionId"]
        creditCard <- map["CountryId"]
        cvv <- map["HotelAreaIds"]
        owner <- map["CheckMyTripId"]
        cardMonth <- map["ExcursionId"]
        cardYear <- map["CountryId"]
        currencyCode <- map["HotelAreaIds"]
        amount <- map["HotelAreaIds"]
    }
}
