//
//  GetTouristListRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 17.06.2021.
//

import UIKit
import ObjectMapper

public class GetTouristListRequestModel: Mappable{
    
    public var countryId : Int?
    public var customerId : Int?
    public var excursionId : Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(countryId: Int, customerId: Int, excursionId: Int) {
        self.countryId = countryId
        self.customerId = customerId
        self.excursionId = excursionId
    }

    public func mapping(map: Map) {
        countryId <- map["CountryId"]
        customerId <- map["CustomerId"]
        excursionId <- map["ExcursionId"]
    }
    
}
