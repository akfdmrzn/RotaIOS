//
//  SendRatedTourList.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 3.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public class SendRatedTourList: Mappable {
    
    public var customerId:Int!
    public var tourId:String!
    public var partnerNumber:Int!
    public var value:Int!
    public var valueString:String!
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId:Int,tourId :String,partnerNumber : Int,value : Int) {
        self.customerId = customerId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.value = value
    }
    
    public init(customerId:Int,tourId :String,partnerNumber : Int,valueString : String) {
        self.customerId = customerId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.valueString = valueString
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        partnerNumber <- map["PartnerNumber"]
        value <- map["Value"]
        valueString <- map["Value"]
    }
    
}


