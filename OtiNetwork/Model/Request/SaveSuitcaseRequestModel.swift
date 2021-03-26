//
//  SaveSuitcaseRequestModel.swift
//  OtiNetwork
//
//  Created by Akif Demirezen on 25.03.2021.
//

import Foundation
import ObjectMapper

public class SaveSuitcaseRequestModel: Mappable{
    
    public var customerId:Int!
    public var tourId:String!
    public var partnerNumber:Int!
    public var value:Int!
    public var type:Int!
    public var incomingId:Int!
                
    public required init?(map: Map) {
        
    }
    
    public init(customerId: Int,tourId : String,partnerNumber : Int,value : Int,type : Int,incomingId : Int) {
        self.customerId = customerId
        self.tourId = tourId
        self.partnerNumber = partnerNumber
        self.value = value
        self.type = type
        self.incomingId = incomingId
    }
    
    public func mapping(map: Map) {
        customerId <- map["CustomerId"]
        tourId <- map["TourId"]
        partnerNumber <- map["PartnerNumber"]
        value <- map["Value"]
        type <- map["Type"]
        incomingId <- map["IncomingId"]
    }
    
}
