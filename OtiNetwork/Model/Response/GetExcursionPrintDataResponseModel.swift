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
    
    var extraList: [ExtraList]?
    var transferList: [String]?
    var voucher: Voucher?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        extraList <- map["ExtraList"]
        transferList <- map["TransferList"]
        voucher <- map["Voucher"]
    }
    
}

public class ExtraList : Mappable {
    var currency: String?
    var info: String?
    var amount: Double?
    var name: String?
    var currencyLocal: String?
    var countryCode: String?
    var amountStr: String?
    var amountStr2: String?
    
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
    var currencyId: Int?
    var marketId: Int?
    var saleDate: String?
    var saleDateString: String?
    var tourId: Int?
    var adultCount: Int?
    var childCount: Int?
    var printDate: String?
    var printDateString: String?
    var date: String?
    var dateString: String?
    var voucher: String?
    var address: String?
    var tour: String?
    var concept: String?
    var transfer: String?
    var hotel: String?
    var room: String?
    var pickUp: String?
    var meetingPoint: String?
    var leaderName: String?
    var operatr: String?
    var resNo: String?
    var grandTotal: Double?
    var discount: String?
    var tourPax: String?
    var refundCondition: String?
    var notes: String?
    var currency: String?
    var paymentType: String?
    var ticketNumber: String?
    var ticketCount: Int?
    var paymentStr: String?
    var tourAmount: Double?
    var areaId: Int?
    var grandTotalLocal: Double?
    var currencyLocal: String?
    var vat: Double?
    var vatLocal: Double?
    var discountLocal: Double?
    var countryCode: String?
    var vatStr: String?
    var vatStr2: String?
    var vatLocalStr: String?
    var vatLocalStr2: String?
    var grandTotalStr: String?
    var grandTotalStr2: String?
    var dubaiAmountStr: String?
    var dubaiAmountStr2: String?
    var dubaiAmountLocalStr: String?
    var dubaiAmountLocalStr2: String?
    var tourAmountStr: String?
    var tourAmountStr2: String?
    var discountStr: String?
    var discountStr2: String?
    var discountLocalStr: String?
    var discountLocalStr2: String?
    var grandTotalLocalStr: String?
    var grandTotalLocalStr2: String?
    var personalDataWarnig: String?
    var personalDataWarnigLabel: String?
    
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
