//
//  GetListRequestModel.swift
//  BaseProject
//
//  Created by Akif Demirezen on 28.05.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetListRequestModel:Mappable{
    
    public var customerId:Int!
    public var tourId:String!
    public var type:Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int, tourId: String, type: Int? = nil) {
        self.customerId = customerId
        self.tourId = tourId
        self.type = type
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        type <- map["Type"]
        
    }
}
