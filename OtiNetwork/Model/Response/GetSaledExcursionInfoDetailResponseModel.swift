//
//  GetSaledExcursionInfoDetailResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 22.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetSaledExcursionInfoDetailResponseModel: Mappable {
    public var voucherNo: String?
    public var tourName: String?
    public var totalPax: Int?
    public var pickupTime: String?
    public var pickupPointId: Int?
    public var pickupPointName: String?
    public var tourSaleId: Int?
    public var tourDate: String?
    public var tourDateString: String?
    public var imageUrl: String?
    public var paidBy: String?
    public var paymentAmount: Int?
    public var paymentCurrency: String?
    public var discountAmount: Int?
    public var promotionId: Int?
    public var promotionName: String?
    public var guideName: String?
    public var guidePhoneNumber: String?
    public var vehicleName: String?
    public var vehiclePlate: String?
    public var extraServiceDetailType: Int?
    public var extraServiceDetailName: String?
    public var tourists: [Tourist]?
    public var refundCondition: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        voucherNo <- map["VoucherNo"]
        tourName <- map["TourName"]
        totalPax <- map["TotalPax"]
        pickupTime <- map["PickupTime"]
        pickupPointId <- map["PickupPointId"]
        pickupPointName <- map["PickupPointName"]
        tourSaleId <- map["TourSaleId"]
        tourDate <- map["TourDate"]
        tourDateString <- map["TourDateString"]
        imageUrl <- map["ImageUrl"]
        paidBy <- map["PaidBy"]
        paymentAmount <- map["PaymentAmount"]
        paymentCurrency <- map["PaymentCurrency"]
        discountAmount <- map["DiscountAmount"]
        promotionId <- map["PromotionId"]
        promotionName <- map["PromotionName"]
        guideName <- map["GuideName"]
        guidePhoneNumber <- map["GuidePhoneNumber"]
        vehicleName <- map["VehicleName"]
        vehiclePlate <- map["VehiclePlate"]
        extraServiceDetailType <- map["ExtraServiceDetailType"]
        extraServiceDetailName <- map["ExtraServiceDetailName"]
        tourists <- map["Tourists"]
        refundCondition <- map["RefundCondition"]
    }
    
}

public class Tourist: Mappable {
    public var id: String?
    public var fullName: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        id <- map["Id"]
        fullName <- map["FullName"]
    }
    
}
