//
//  GetIndShopHotelListForMobileResponseModel.swift
//  RotaIOS
//
//  Created by odeon on 31.12.2021.
//

import Foundation
import ObjectMapper

public class GetIndShopHotelListForMobileResponseModel: Mappable{
    var _id : String = ""
    var id : Int = 0
    var hotelId : Int = 0
    var hotel : String = ""
    var place : String = ""
    var planPax : String = ""
    var voucherNumber : String = ""
    var reelPax : Int = 0
    var pickUpTimeStr : String = ""

    required public init?(map: Map) {

    }
    
    public func mapping(map: Map) {

        _id <- map["$id"]
        id <- map["Id"]
        hotelId <- map["HotelId"]
        hotel <- map["Hotel"]
        place <- map["Place"]
        planPax <- map["PlanPax"]
        voucherNumber <- map["VoucherNumber"]
        reelPax <- map["ReelPax"]
        pickUpTimeStr <- map["PickUpTimeStr"]
    }
}
