//
//  GetUserPaymentsResponseModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 29.07.2021.
//

import UIKit
import ObjectMapper

public class GetUserPaymentsResponseModel: Mappable {
    
    public var excursionId : Int?
    public var countryId : Int?
    public var threadGuid : String?
    public var paymentStatus : Int?
    public var amount : Double?
    public var currencyCode : String?
    public var paymentType : String?
    public var hotelId : Int?
    public var saleDate : Int?
    public var payId : Int?
    public var bookStatus : Int?
    public var excursionVoucherNumber : String?
    public var preBookingVoucher : String?
    public var excursion : ExcursionUserPayment?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        excursionId <- map["excursionid"]
        countryId <- map["countryId"]
        threadGuid <- map["threadguid"]
        paymentStatus <- map["paymentstatus"]
        amount <- map["amount"]
        currencyCode <- map["CurrencyCode"]
        paymentType <- map["PaymentType"]
        hotelId <- map["HotelId"]
        saleDate <- map["saleDate"]
        payId <- map["PayId"]
        bookStatus <- map["BookStatus"]
        excursionVoucherNumber <- map["ExcursionVoucherNumber"]
        preBookingVoucher <- map["PreBookingVoucher"]
        excursion <- map["Excursion"]
    }
}
public class ExcursionUserPayment: Mappable {
    
    public var name : String?
    public var image : String?
    
    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        name <- map["Name"]
        image <- map["Image"]
    }
}
