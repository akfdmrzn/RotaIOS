//
//  PaidCalendarRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 18.06.2021.
//

import UIKit
import ObjectMapper

public class PaidCalendarRequestModel: Mappable{
    
    public var checkMyTripId : String?
    public var excursionId : Int?
    public var countryId : Int?
    public var hotelAreaIds : [Int]?
    
    public required init?(map: Map) {
        
    }
    
    public init(checkMyTripId: String, excursionId: Int, countryId: Int, hotelAreaIds: [Int]) {
        self.checkMyTripId = checkMyTripId
        self.excursionId = excursionId
        self.countryId = countryId
        self.hotelAreaIds = hotelAreaIds
    }

    public func mapping(map: Map) {
        checkMyTripId <- map["CheckMyTripId"]
        excursionId <- map["ExcursionId"]
        countryId <- map["CountryId"]
        hotelAreaIds <- map["HotelAreaIds"]
    }
    
}
