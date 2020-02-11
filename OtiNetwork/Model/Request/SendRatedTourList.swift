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
    public var touristId:Int!
    public var incomingId:Int!
    public var tourId:String!
    public var partnerNumber:Int!
    public var value:Int!
    public var valueString:String!
    public var type: Int?
    
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int, touristId: Int, incomingId: Int, tourId: String, partnerNumber: Int, value: Int, type: Int? = nil) {
        self.customerId = customerId
        self.touristId = touristId
        self.incomingId = incomingId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.value = value
        self.type = type
    }
    
    public init(customerId: Int, touristId: Int, incomingId: Int, tourId: String, partnerNumber: Int, valueString: String, type: Int? = nil) {
        self.customerId = customerId
        self.touristId = touristId
        self.incomingId = incomingId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.valueString = valueString
        self.type = type
    }
    
    // Bu fonksiyon rate your excursion eklendikten sonra gereksiz hale gelecek, eski versiyonu desteklemek amaçlı eklendi.
    public init(customerId: Int, tourId: String, partnerNumber: Int, value: Int, type: Int? = nil) {
        self.customerId = customerId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.value = value
        self.type = type
    }
    
    // Bu fonksiyon rate your excursion eklendikten sonra gereksiz hale gelecek, eski versiyonu desteklemek amaçlı eklendi.
    public init(customerId: Int, tourId: String, partnerNumber: Int, valueString: String, type: Int? = nil) {
        self.customerId = customerId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.valueString = valueString
        self.type = type
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        partnerNumber <- map["PartnerNumber"]
        value <- map["Value"]
        valueString <- map["Value"]
        type <- map["Type"]
        touristId <- map["TouristId"]
        incomingId <- map["IncomingId"]
    }
    
}


