//
//  GetSaledExcursionInfoDetailResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 22.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetSaledExcursionInfoDetailResponseModel: Mappable {
    var voucherNo: String?
    var tourName: String?
    var totalPax: Int?
    var pickupTime: String?
    var pickupPointId: Int?
    var pickupPointName: String?
    var tourSaleId: Int?
    var tourDate: String?
    var tourDateString: String?
    var imageUrl: String?
    var paidBy: String?
    var paymentAmount: Int?
    var paymentCurrency: String?
    var discountAmount: Int?
    var promotionId: Int?
    var promotionName: String?
    var guideName: String?
    var guidePhoneNumber: String?
    var vehicleName: String?
    var vehiclePlate: String?
    var extraServiceDetailType: Int?
    var extraServiceDetailName: String?
    var tourists: [Tourist]?
    var refundCondition: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
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

class Tourist: Mappable {
    var id: String?
    var fullName: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id <- map["Id"]
        fullName <- map["FullName"]
    }
    
}
