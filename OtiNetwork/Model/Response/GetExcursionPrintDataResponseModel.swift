//
//  GetExcursionPrintDataResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 22.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetExcursionPrintDataResponseModel: Mappable {
    
    public var extraList: [ExtraList]?
    public var transferList: [String]?
    public var voucher: Voucher?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        extraList <- map["ExtraList"]
        transferList <- map["TransferList"]
        voucher <- map["Voucher"]
    }
    
}

public class ExtraList : Mappable {
    public var currency: String?
    public var info: String?
    public var amount: Double?
    public var name: String?
    public var currencyLocal: String?
    public var countryCode: String?
    public var amountStr: String?
    public var amountStr2: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        currency <- map["Currency"]
        info <- map["Info"]
        amount <- map["Amount"]
        name <- map["Name"]
        currencyLocal <- map["CurrencyLocal"]
        countryCode <- map["CountryCode"]
        amountStr <- map["AmountStr"]
        amountStr2 <- map["AmountStr2"]
    }
    
}


public class Voucher : Mappable {
    public var currencyId: Int?
    public var marketId: Int?
    public var saleDate: String?
    public var saleDateString: String?
    public var tourId: Int?
    public var adultCount: Int?
    public var childCount: Int?
    public var printDate: String?
    public var printDateString: String?
    public var date: String?
    public var dateString: String?
    public var voucher: String?
    public var address: String?
    public var tour: String?
    public var concept: String?
    public var transfer: String?
    public var hotel: String?
    public var room: String?
    public var pickUp: String?
    public var meetingPoint: String?
    public var leaderName: String?
    public var operatr: String?
    public var resNo: String?
    public var grandTotal: Double?
    public var discount: String?
    public var tourPax: String?
    public var refundCondition: String?
    public var notes: String?
    public var currency: String?
    public var paymentType: String?
    public var ticketNumber: String?
    public var ticketCount: Int?
    public var paymentStr: String?
    public var tourAmount: Double?
    public var areaId: Int?
    public var grandTotalLocal: Double?
    public var currencyLocal: String?
    public var vat: Double?
    public var vatLocal: Double?
    public var discountLocal: Double?
    public var countryCode: String?
    public var vatStr: String?
    public var vatStr2: String?
    public var vatLocalStr: String?
    public var vatLocalStr2: String?
    public var grandTotalStr: String?
    public var grandTotalStr2: String?
    public var dubaiAmountStr: String?
    public var dubaiAmountStr2: String?
    public var dubaiAmountLocalStr: String?
    public var dubaiAmountLocalStr2: String?
    public var tourAmountStr: String?
    public var tourAmountStr2: String?
    public var discountStr: String?
    public var discountStr2: String?
    public var discountLocalStr: String?
    public var discountLocalStr2: String?
    public var grandTotalLocalStr: String?
    public var grandTotalLocalStr2: String?
    public var personalDataWarnig: String?
    public var personalDataWarnigLabel: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        currencyId <- map["CurrencyId"]
        marketId <- map["MarketId"]
        saleDate <- map["SaleDate"]
        saleDateString <- map["SaleDateString"]
        tourId <- map["TourId"]
        adultCount <- map["AdultCount"]
        childCount <- map["ChildCount"]
        printDate <- map["PrintDate"]
        printDateString <- map["PrintDateString"]
        date <- map["Date"]
        dateString <- map["DateString"]
        voucher <- map["Voucher"]
        address <- map["Address"]
        tour <- map["Tour"]
        concept <- map["Concept"]
        transfer <- map["Transfer"]
        hotel <- map["Hotel"]
        room <- map["Room"]
        pickUp <- map["PickUp"]
        meetingPoint <- map["MeetingPoint"]
        leaderName <- map["LeaderName"]
        operatr <- map["Operator"]
        resNo <- map["ResNo"]
        grandTotal <- map["GrandTotal"]
        discount <- map["Discount"]
        tourPax <- map["TourPax"]
        refundCondition <- map["RefundCondition"]
        notes <- map["Notes"]
        currency <- map["Currency"]
        paymentType <- map["PaymentType"]
        ticketNumber <- map["TicketNumber"]
        ticketCount <- map["TicketCount"]
        paymentStr <- map["PaymentStr"]
        tourAmount <- map["TourAmount"]
        areaId <- map["AreaId"]
        grandTotalLocal <- map["GrandTotalLocal"]
        currencyLocal <- map["CurrencyLocal"]
        vat <- map["Vat"]
        vatLocal <- map["VatLocal"]
        discountLocal <- map["DiscountLocal"]
        countryCode <- map["CountryCode"]
        vatStr <- map["VatStr"]
        vatStr2 <- map["VatStr2"]
        vatLocalStr <- map["VatLocalStr"]
        vatLocalStr2 <- map["VatLocalStr2"]
        grandTotalStr <- map["GrandTotalStr"]
        grandTotalStr2 <- map["GrandTotalStr2"]
        dubaiAmountStr <- map["DubaiAmountStr"]
        dubaiAmountStr2 <- map["DubaiAmountStr2"]
        dubaiAmountLocalStr <- map["DubaiAmountLocalStr"]
        dubaiAmountLocalStr2 <- map["DubaiAmountLocalStr2"]
        tourAmountStr <- map["TourAmountStr"]
        tourAmountStr2 <- map["TourAmountStr2"]
        discountStr <- map["DiscountStr"]
        discountStr2 <- map["DiscountStr2"]
        discountLocalStr <- map["DiscountLocalStr"]
        discountLocalStr2 <- map["DiscountLocalStr2"]
        grandTotalLocalStr <- map["GrandTotalLocalStr"]
        grandTotalLocalStr2 <- map["GrandTotalLocalStr2"]
        personalDataWarnig <- map["PersonalDataWarnig"]
        personalDataWarnigLabel <- map["PersonalDataWarnigLabel"]
    }
    
}
