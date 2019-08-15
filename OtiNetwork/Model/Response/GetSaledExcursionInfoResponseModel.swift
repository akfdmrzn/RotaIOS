//
//  GetSaledExcursionInfoResponseModel.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 19.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class GetSaledExcursionInfoResponseModel: Mappable {
    
    var voucherNo: String?
    var tourName: String?
    var totalPax: Int?
    var pickupTime: String?
    var pickupPointId: Int?
    var pickupPointName: String?
    var tourSaleId: Int?
    var tourDate: String?
    var tourDateString: String?
    var imageUrl: String = ""
    
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
    }
    
}

