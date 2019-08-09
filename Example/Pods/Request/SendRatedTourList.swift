//
//  SendRatedTourList.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 3.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

class SendRatedTourList: Mappable {
    
    var customerId:Int!
    var tourId:String!
    var partnerNumber:Int!
    var value:Int!
    var valueString:String!
    
    required init?(map: Map) {
        
    }
    
    init(customerId:Int,tourId :String,partnerNumber : Int,value : Int) {
        self.customerId = customerId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.value = value
    }
    
    init(customerId:Int,tourId :String,partnerNumber : Int,valueString : String) {
        self.customerId = customerId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.valueString = valueString
    }
    
    func mapping(map: Map) {
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        partnerNumber <- map["PartnerNumber"]
        value <- map["Value"]
        valueString <- map["Value"]
    }
    
}


