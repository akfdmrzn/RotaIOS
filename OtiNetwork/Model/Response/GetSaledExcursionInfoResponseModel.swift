//
//  GetSaledExcursionInfoResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 19.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetSaledExcursionInfoResponseModel: Mappable {
    
    public var voucherNo: String?
    public var tourName: String?
    public var totalPax: Int?
    public var pickupTime: String?
    public var pickupPointId: Int?
    public var pickupPointName: String?
    public var tourSaleId: Int?
    public var tourDate: String?
    public var tourDateString: String?
    public var imageUrl: String = ""
    
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
    }
    
}

