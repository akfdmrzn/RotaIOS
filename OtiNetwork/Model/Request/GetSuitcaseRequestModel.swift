//
//  GetSuitcaseRequestModel.swift
//  OtiNetwork
//
//  Created by odeon on 18.03.2021.
//

import Foundation
import ObjectMapper

public class GetSuitcaseRequestModel: Mappable{
    
    public var customerId:Int!
    public var tourId:Int!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int, tourId: Int) {
        self.customerId = customerId
        self.tourId = tourId
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
    }
    
}
